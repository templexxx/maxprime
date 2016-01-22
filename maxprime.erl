-module(maxprime).

%%-export([get/1]).
-compile(export_all).


get(Num) ->
	case expression of
		pattern when guard ->
			body
	end

p_guess(Num) ->
	LnNum = math:log(Num),
	LnNum / (1 + (1 / LnNum)
			   + (2 / (math:pow(LnNum, 2)))
			   + (6 / (math:pow(LnNum, 3)))
			   + (24 / (math:pow(LnNum, 4)))
			   + (120 / (math:pow(LnNum, 5)))
			   + (720 / (math:pow(LnNum, 6)))
			   + (5040 / (math:pow(LnNum, 7)))
			   + (40320 / (math:pow(LnNum, 8)))).


first_guess(Num) ->
	P_guess = p_guess(Num),
	Num - round(P_guess).


montgomery()

	