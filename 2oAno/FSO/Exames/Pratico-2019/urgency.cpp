/**
 * @file
 *
 * \brief A hospital pediatric urgency with a Manchester triage system.
 */

#include  <stdio.h>
#include  <stdlib.h>
#include  <string.h>
#include  <libgen.h>
#include  <unistd.h>
#include  <sys/wait.h>
#include  <sys/types.h>
#include  <thread.h>
#include  <math.h>
#include  <stdint.h>
#include  <signal.h>
#include  <utils.h>
#include  "settings.h"
#include  "pfifo.h"

#include "thread.h"
//#include "process.h"

#include <iostream>

#define USAGE "Synopsis: %s [options]\n" \
   "\t----------+-------------------------------------------\n" \
   "\t  Option  |          Description                      \n" \
   "\t----------+-------------------------------------------\n" \
   "\t -p num   | number of patients (dfl: 4)               \n" \
   "\t -n num   | number of nurses (dfl: 1)                 \n" \
   "\t -d num   | number of doctors (dfl: 1)                \n" \
   "\t -h       | this help                                 \n" \
   "\t----------+-------------------------------------------\n"

/**
 * \brief Patient data structure
 */
typedef struct
{
   char name[MAX_NAME+1];
   int done; // 0: waiting for consultation; 1: consultation finished

   pthread_mutex_t waitmutx;
   pthread_cond_t waitcond;
} Patient;

typedef struct
{
    int num_patients;
    Patient all_patients[MAX_PATIENTS];
    PriorityFIFO triage_queue;
    PriorityFIFO doctor_queue;
} HospitalData;

HospitalData * hd = NULL;

/**
 *  \brief patient verification test
 */
#define check_valid_patient(id) do { check_valid_id(id); check_valid_name(hd->all_patients[id].name); } while(0)

int random_manchester_triage_priority();
void new_patient(Patient* patient); // initializes a new patient
void random_wait();

/* ************************************************* */

/* changes may be required to this function */
void init_simulation(uint32_t np)
{
   printf("Initializing simulation\n");
   hd = (HospitalData*)mem_alloc(sizeof(HospitalData)); // mem_alloc is a malloc with NULL pointer verification
   memset(hd, 0, sizeof(HospitalData));
   hd->num_patients = np;
   init_pfifo(&hd->triage_queue);
   init_pfifo(&hd->doctor_queue);
}

/* ************************************************* */

void nurse_iteration()
{
   printf("\e[34;01mNurse: get next patient\e[0m\n");
   uint32_t patient = retrieve_pfifo(&hd->triage_queue);
   
   check_valid_id(patient);
   if(hd->all_patients[patient].done==1 && strcmp(hd->all_patients[patient].name," "))
   {
      printf("\e[34;01mNurse: Ending thread\e[0m\n");
      thread_exit(NULL);
   }
   
   check_valid_patient(patient);
   printf("\e[34;01mNurse: evaluate patient %u priority\e[0m\n", patient);
   uint32_t priority = random_manchester_triage_priority();
   printf("\e[34;01mNurse: add patient %u with priority %u to doctor queue\e[0m\n", patient, priority);
   insert_pfifo(&hd->doctor_queue, patient, priority);
}

void* nurse_thread(void * arg)
{
   random_wait();
   printf("\e[34;01mHello Im nurse \e[0m\n");
   while(true)
   {
      nurse_iteration();
   }
   return NULL;
}

/* ************************************************* */
void doctor_end_of_consultation(int id)
{
   mutex_lock(&hd->all_patients[id].waitmutx);
   hd->all_patients[id].done = 1;
   cond_broadcast(&hd->all_patients[id].waitcond);
   mutex_unlock(&hd->all_patients[id].waitmutx);
}

void doctor_iteration()
{
   printf("\e[32;01mDoctor: get next patient\e[0m\n");
   uint32_t patient = retrieve_pfifo(&hd->doctor_queue);

   check_valid_id(patient);
   if(hd->all_patients[patient].done==1 && strcmp(hd->all_patients[patient].name," "))
   {
      printf("\e[32;01mDoctor: Ending thread\e[0m\n");
      thread_exit(NULL);
   }

   check_valid_patient(patient);
   printf("\e[32;01mDoctor: treat patient %u\e[0m\n", patient);
   random_wait();
   printf("\e[32;01mDoctor: patient %u treated\e[0m\n", patient);

   doctor_end_of_consultation(patient);
}

void* doctor_thread(void * arg)
{
   random_wait();
   printf("\e[32;01mHello Im doctor \e[0m\n");
   while(true)
   {
      doctor_iteration();
   }
   return NULL;
}

/* ************************************************* */

void patient_goto_urgency(int id)
{
   new_patient(&hd->all_patients[id]);
   check_valid_name(hd->all_patients[id].name);
   printf("\e[30;01mPatient %s (number %u): get to hospital\e[0m\n", hd->all_patients[id].name, id);
   insert_pfifo(&hd->triage_queue, id, 1); // all elements in triage queue with the same priority!
}

/* changes may be required to this function */
void patient_wait_end_of_consultation(int id)
{
   check_valid_patient(id);

   mutex_lock(&hd->all_patients[id].waitmutx);
   while(!hd->all_patients[id].done)
   {
      cond_wait(&hd->all_patients[id].waitcond,&hd->all_patients[id].waitmutx);
   }
   
   printf("\e[30;01mPatient %s (number %u): health problems treated\e[0m\n", hd->all_patients[id].name, id);
   mutex_unlock(&hd->all_patients[id].waitmutx);
}

/* changes are required to this function */
void patient_life(int id)
{
   patient_goto_urgency(id);
   patient_wait_end_of_consultation(id);
   memset(&(hd->all_patients[id]), 0, sizeof(Patient)); // patient finished
}

void* patient_thread(void * arg)
{
   random_wait();
   int id = *(int*)arg;
   printf("\e[30;01mHello Im patient %d \e[0m\n",id);

   patient_life(id);
   return NULL;
}

/* ************************************************* */

int main(int argc, char *argv[])
{
   uint32_t npatients = 4;  ///< number of patients
   uint32_t nnurses = 1;    ///< number of triage nurses
   uint32_t ndoctors = 1;   ///< number of doctors

   /* command line processing */
   int option;
   while ((option = getopt(argc, argv, "p:n:d:h")) != -1)
   {
      switch (option)
      {
         case 'p':
            npatients = atoi(optarg);
            if (npatients < 1 || npatients > MAX_PATIENTS)
            {
               fprintf(stderr, "Invalid number of patients!\n");
               return EXIT_FAILURE;
            }
            break;
         case 'n':
            nnurses = atoi(optarg);
            if (nnurses < 1)
            {
               fprintf(stderr, "Invalid number of nurses!\n");
               return EXIT_FAILURE;
            }
            break;
         case 'd':
            ndoctors = atoi(optarg);
            if (ndoctors < 1)
            {
               fprintf(stderr, "Invalid number of doctors!\n");
               return EXIT_FAILURE;
            }
            break;
         case 'h':
            printf(USAGE, basename(argv[0]));
            return EXIT_SUCCESS;
         default:
            fprintf(stderr, "Non valid option!\n");
            fprintf(stderr, USAGE, basename(argv[0]));
            return EXIT_FAILURE;
      }
   }

   /* start random generator */
   srand(getpid());

   /* init simulation */
   init_simulation(npatients);

   /* dummy code to show a very simple sequential behavior */
   /*
   for(uint32_t i = 0; i < npatients; i++)
   {
      printf("\n");
      random_wait(); // random wait for patience creation
      patient_life(i);
   }
   */

   pthread_t patients[npatients];
   uint32_t ids[npatients];
   for(uint32_t i = 0; i < npatients; i++)
   {
      ids[i]=i;
      thread_create(&patients[i],NULL,patient_thread,&ids[i]);
   }

   pthread_t nurses[nnurses];
   for(uint32_t i = 0; i < nnurses; i++)
   {
      thread_create(&nurses[i],NULL,nurse_thread,NULL);
   }

   pthread_t doctors[ndoctors];
   for(uint32_t i = 0; i < ndoctors; i++)
   {
      thread_create(&doctors[i],NULL,doctor_thread,NULL);
   }


   for(uint32_t i = 0; i < npatients; i++)
   {
      thread_join(patients[i],NULL);
   }

   Patient empty_patient;
   empty_patient.done = 1;
   strcpy(empty_patient.name, "");
   hd->all_patients[0]=empty_patient;
   for(uint32_t i = 0; i < nnurses; i++)
   {
      insert_pfifo(&hd->triage_queue, 0, 1);
   }
   for(uint32_t i = 0; i < ndoctors; i++)
   {
      insert_pfifo(&hd->doctor_queue, 0, 1);
   }

   for(uint32_t i = 0; i < nnurses; i++)
   {
      thread_join(nurses[i],NULL);
   }

   for(uint32_t i = 0; i < ndoctors; i++)
   {
      thread_join(doctors[i],NULL);
   }

   delete hd;

   return EXIT_SUCCESS;
}


/* YOU MAY IGNORE THE FOLLOWING CODE */

int random_manchester_triage_priority()
{
   int result;
   int perc = (int)(100*(double)rand()/((double)RAND_MAX)); // in [0;100]
   if (perc < 10)
      result = RED;
   else if (perc < 30)
      result = ORANGE;
   else if (perc < 50)
      result = YELLOW;
   else if (perc < 75)
      result = GREEN;
   else
      result = BLUE;
   return result;
}

static char **names = (char *[]) {"Ana", "Miguel", "Luis", "Joao", "Artur", "Maria", "Luisa", "Mario", "Augusto", "Antonio", "Jose", "Alice", "Almerindo", "Gustavo", "Paulo", "Paula", NULL};

char* random_name()
{
   static int names_len = 0;
   if (names_len == 0)
   {
      for(names_len = 0; names[names_len] != NULL; names_len++)
         ;
   }

   return names[(int)(names_len*(double)rand()/((double)RAND_MAX+1))];
}

void new_patient(Patient* patient)
{
   strcpy(patient->name, random_name());
   patient->done = 0;
}

void random_wait()
{
   usleep((useconds_t)(MAX_WAIT*(double)rand()/(double)RAND_MAX));
}

