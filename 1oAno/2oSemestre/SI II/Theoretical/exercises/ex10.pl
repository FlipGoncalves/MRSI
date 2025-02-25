% Go to the Oval Crater station -> move(oval_crater)
% Go to Deep Crater -> move(deep_crater)
% Load a barrel at the Lunar Valley station -> load(lunar_valley,barrel)
% Load a food package at Oval Crater -> move(oval_crater,food)

frase(move(Where)) -> [go,to], estacao(Where).
frase(load(Where,What)) -> [load,a], load_object(What), [at], estacao(Where).

estacao(Where) -> nome_estacao(Where).
estacao(Where) -> [the], nome_estacao(Where), [station].

nome_estacao(oval_crater) -> [oval,crater].
nome_estacao(deep_crater) -> [deep,crater].
nome_estacao(lunar_valley) -> [lunar,valley].

load_object(barrel) -> [barrel].
load_object(food_package) -> [food,package].