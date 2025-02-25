example(1, (the, cats, are, smelly))
example(2, (the, cats, is, smelly))

:- discontiguous vp/2, np/2, verb/2.

sentence(s(NP, VP)) --> np(NP,Num), vp(VP,Num).

np(np(PN), Num) --> properNoun(PN).
np(np(ART, CN), Num) --> article(ART, Num), commonNoun(CN, Num).
vp(vp(V, NP), Num) --> verb(V, Num), np(NP, _).
vp(vp(V, ADJ), Num) --> verb(V, Num), adjective(ADJ).

commonNoun(cNoun(breeze), sing) --> [ breeze ].
commonNoun(cNoun(city), sing) --> [ city ].
commonNoun(cNoun(man), sing) --> [ man ].
commonNoun(cNoun(men), plur) --> [ men ].
commonNoun(cNoun(cat), sing) --> [ cat ].
commonNoun(cNoun(cats), plur) --> [ cats ].

properNoun(pNoun(peter)) --> [ peter ] .
properNoun(pNoun(aveiro)) --> [ aveiro ] .
verb(v(be), sing) --> [ is ] .
verb(v(be), plur) --> [ are ] .
adjective(adj(smelly)) --> [ smelly ] .
adjective(adj(beautiful)) --> [ beautiful ] .
article(art(the), _) --> [ the ] .
article(art(a), sing) --> [ a ] .
article(art(a), sing) --> [ an ] .

# c)

vp --> verb , pp.
pp --> preposition, np.
preposition --> [ in ].

# d)

np --> pronoun .

pronoun --> [ i ]. % subject
pronoun --> [ you ].
pronoun --> [ he ].
pronoun --> [ she ].
pronoun --> [ we ].
pronoun --> [ they ].

pronoun --> [ me ]. % object
pronoun --> [ you ] .
pronoun --> [ him ] .
pronoun --> [ her ] .
pronoun --> [ them ] .
pronoun --> [ us ] .

verb --> [ love ] .
verb --> [ loves ] .