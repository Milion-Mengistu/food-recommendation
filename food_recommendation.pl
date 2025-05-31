:- dynamic(fact/1).

% Read command line args as facts
load_facts([]).
load_facts([H|T]) :-
    assertz(fact(H)),
    load_facts(T).

recommend_food :-
    findall(Food, recommend(Food), Recommendations),
    list_to_set(Recommendations, Unique),
    ( Unique = [] ->
        writeln('Sorry, no suitable food found based on your preferences.')
    ;
        format('Based on your preferences, we recommend: ~w~n', [Unique])
    ).

% Food recommendation rules

recommend(pancakes) :-
    fact(morning), fact(sweet), \+ fact(hurry).
recommend(sandwich) :-
    fact(morning), \+ fact(sweet), fact(hurry).
recommend(salad) :-
    fact(vegetarian), fact(hot_weather), fact(hungry).
recommend(pizza) :-
    fact(hungry), \+ fact(morning), \+ fact(vegetarian).
recommend(ice_cream) :-
    fact(hot_weather), fact(sweet).
recommend(fruit_bowl) :-
    fact(vegetarian), fact(sweet), \+ fact(hurry).
recommend(soup) :-
    \+ fact(hot_weather), fact(relaxing).
recommend(water) :-
    \+ fact(hungry), fact(hot_weather).
recommend(burger) :-
    fact(hungry), \+ fact(vegetarian), \+ fact(morning).
recommend(tea) :-
    fact(morning), fact(relaxing).
recommend(pasta) :-
    \+ fact(morning), \+ fact(hurry).
recommend(smoothie) :-
    fact(hot_weather), fact(sweet).

% Entry point

main :-
    current_prolog_flag(argv, Argv),
    load_facts(Argv),
    recommend_food,
    halt.
