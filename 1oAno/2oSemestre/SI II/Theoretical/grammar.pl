
frase --> sn(suj), sv.

sn(Caso) --> pronome(Caso).
sn(_)    --> substantivo.
sn(_)    --> artigo, substantivo.
sn(_)    --> artigo, adjectivo, 
             substantivo.

sp --> preposicao, sn(obj).

sv --> verbo.
sv --> verbo, sn(obj).
sv --> verbo, sp.
sv --> verbo, adverbio.
sv --> verbo, sn(obj), sn(obj).
sv --> verbo, sn(obj), sp.
sv --> verbo, adjectivo.

verbo --> [is].
verbo --> [give].
verbo --> [see].
verbo --> [smell].
verbo --> [go].

adverbio --> [here].
adverbio --> [there].

substantivo --> [breeze].
substantivo --> [gold].

pronome(suj) --> [i].
pronome(suj) --> [you].
pronome(suj) --> [he].
pronome(suj) --> [she].

pronome(obj) --> [me].
pronome(obj) --> [you].
pronome(obj) --> [him].
pronome(obj) --> [her].

adjectivo --> [smelly].
adjectivo --> [beautiful].

artigo --> [the].
artigo --> [a].
artigo --> [an].

preposicao --> [to].
preposicao --> [in].
preposicao --> [on].
preposicao --> [at].


