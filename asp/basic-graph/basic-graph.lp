node(1..6).

% Describes the directed graph: basic-graph.dot

edge(1, 2; 1, 3; 1, 4).
edge(2, 4; 2, 6).
edge(3, 4).
edge(5, 4; 5, 6).

% Paths are reflexive: every node can reach itself.
path(X, X) :- node(X).

% Generate a path fact for transitive paths using a recursive rule.
path(Src, Dst) :- edge(Src, Tgt), path(Tgt, Dst).

% Show path predicates. The value 2 is the number of arguments.
#show path/2.

% Path with cost rule. No cost to reach the same node.
cpath(Src, Src, 0) :- node(Src).

% Different formulations of the same rule. Which is better?
% The first is probably more readable, as I do not find the
% subtraction in the second rule intuitive.
cpath(Src, Dst, Cst + 1) :- edge(Src, Tgt), cpath(Tgt, Dst, Cst).
%cpath(Src, Dst, Cst) :- edge(Src, Tgt), cpath(Tgt, Dst, Cst - 1).

#show cpath/3.
