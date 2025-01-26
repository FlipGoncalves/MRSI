#include <assert.h>
#include <cstdint>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "linked-list.h"

/*******************************************************/

SllNode *sllDestroy(SllNode *list) {
  if (list == NULL) {
    list = (SllNode *)malloc(sizeof(SllNode));
    return list;
  }

  if (list->next != NULL) {
    sllDestroy(list->next);
  }

  free(list->reg.name);
  free(list);
  list = (SllNode *)malloc(sizeof(SllNode));
  return list;
}

/*******************************************************/

void sllPrint(SllNode *list, FILE *fout) {
  if (list == NULL)
    return;
  if (list->reg.name == NULL)
    fprintf(fout, "Lista esta inicializada mas nao tem registos validos\n");
  fprintf(fout, "%u\t%s\n", list->reg.nmec, list->reg.name);
  if (list->next != NULL) {
    sllPrint(list->next, fout);
  }
  return;
}

/*******************************************************/

SllNode *sllInsert(SllNode *list, uint32_t nmec, const char *name) {
  assert(name != NULL && name[0] != '\0');
  assert(!sllExists(list, nmec));
  // 1 3 a inserir 2

  if (list != NULL && list->reg.name == NULL) {
    list->reg.nmec = nmec;
    list->reg.name = strdup(name);
    return list;
  }
  // create new node
  struct SllNode *newNode = (SllNode *)malloc(sizeof(SllNode));

  if (newNode == NULL) {
    if (DEBUG) {
      fprintf(
          stderr,
          "An error occured while trying to allocate memory for a new node\n");
    }
    return NULL;
  }

  newNode->reg.nmec = nmec;
  newNode->reg.name = strdup(name);

  if (newNode->reg.name == NULL) {
    if (DEBUG) {
      fprintf(stderr, "An error occured while trying to allocate memory for a "
                      "name in the new node\n");
    }
    return NULL;
  }

  if (list == NULL)
    return newNode;

  if (list->next != NULL && nmec > list->next->reg.nmec) {
    sllInsert(list->next, nmec, name);
    return list;
  }

  if (list->reg.nmec > nmec) {
    newNode->next = list;
    return newNode;
  }

  if (list->next == NULL) {
    list->next = newNode;
    return list;
  }

  SllNode *tmp_node = list->next;
  list->next = newNode;
  newNode->next = tmp_node;

  return list;
}

/*******************************************************/

bool sllExists(SllNode *list, uint32_t nmec) {
  if (list == NULL)
    return false;

  if (list->reg.nmec > nmec) // ja devia ter aparecido
    return false;

  if (nmec == list->reg.nmec)
    return true;

  if (list->next == NULL)
    // se nao ha mais nada e ainda nao foi encontrado retorna false
    return false;

  return sllExists(list->next, nmec);
}

/*******************************************************/

SllNode *sllRemove(SllNode *list, uint32_t nmec) {
  assert(list != NULL);
  assert(sllExists(list, nmec));

  if (list->next == NULL) {
    free(list->reg.name);
    free(list);
    return NULL;
  }

  if (nmec == list->next->reg.nmec) {
    SllNode *node = NULL;
    if (list->next->next != NULL)
      node = list->next->next;

    free(list->next->reg.name);
    free(list->next);
    list->next = node;

    return list;
  }

  return sllRemove(list->next, nmec);
}

/*******************************************************/

const char *sllGetName(SllNode *list, uint32_t nmec) {
  assert(list != NULL);
  assert(sllExists(list, nmec));

  if (nmec == list->reg.nmec)
    return list->reg.name;

  return sllGetName(list->next, nmec);
}

/*******************************************************/

SllNode *sllLoad(SllNode *list, FILE *fin, bool *ok) {
  assert(fin != NULL);
  char c;
  char *name_holder;
  int counter = 0, counter_number, counter_name;
  uint32_t nmec;

  while (!feof(fin)) {
    c = fgetc(fin);
    printf("%c\n", c);
    if (c == EOF) {
      break;
    }
    if (c == ';') {
      printf("Number Counter = %d\n", counter);
      counter_number = counter;
      counter = 0;
    } else if (c == '\n') {
      name_holder = (char *)malloc(counter * sizeof(char));
      printf("Name Counter = %d\n", counter);
      counter_name = counter;
      counter = 0;
      fseek(fin, -(counter_number + counter_name + 2) * sizeof(char), SEEK_CUR);
      printf("ftell antes %ld\n", ftell(fin));
      fscanf(fin, "%d;", &nmec);
      fread(name_holder, sizeof(char), counter_name, fin);
      fgetc(fin);
      printf("ftell depois %ld\n", ftell(fin));
      list = sllInsert(list, nmec, name_holder);

      printf("NMEC:|%d|\n", nmec);
      printf("NAME:|%s|\n", name_holder);
    } else {
      counter++;
    }
  }

  if (ok != NULL)
    *ok = true; // load failure

  return list;
}

/*******************************************************/
