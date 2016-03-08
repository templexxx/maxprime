-module(maxprime).


%-export([get/1]).
-compile(export_all).


%% get the max prime
%%Num < 3317044064679887385961981
get(Num) ->
	Answer = xmr_test(Num),
	if
		Answer =/= true ->
			FirstGuess = first_guess(Num),
			if
				FirstGuess =/= Num ->
					UpTest = up_test(FirstGuess, Num),
					if
						UpTest =/= [] -> UpTest;
						true -> down_test(FirstGuess)
					end;
				true -> down_test(FirstGuess)
			end;
		true -> Num
	end.


%% 求1~Num 间所有素数的和
sum(Num) ->
	sum_main(lists:seq(3, Num), 0).


sum_main([], SUM) ->
	SUM;
sum_main([H | T], SUM) ->
	Answer = xmr_test(H),
	if
		Answer == true ->
			SUM1 = SUM + H,
			sum_main(T, SUM1);
		true ->
			sum_main(T, SUM)
	end.


%%%%%↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑%%%%%
%%%%%↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ YOU NEED CARE ABOUT ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑%%%%%
%%%%%                                                                                                    %%%%%
%%%%%                                                                                                    %%%%%
%%%%%↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ Internal Fuctions ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓%%%%%
%%%%%↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓%%%%%


xmr_test(Num) ->
	if
		Num < 2047 ->
			mr_test(2, Num);
		Num < 1373653 ->
			(mr_test(2, Num)) andalso (mr_test(3, Num));
		Num < 9080191 ->
			(mr_test(31, Num)) andalso (mr_test(73, Num));
		Num < 25326001 ->
			(mr_test(2, Num)) andalso (mr_test(3, Num)) andalso (mr_test(5, Num));
		Num < 4759123141 ->
			(mr_test(2, Num)) andalso (mr_test(7, Num)) andalso (mr_test(61, Num));
		Num < 2152302898747 ->
			(mr_test(2, Num)) andalso (mr_test(3, Num)) andalso (mr_test(5, Num))
				andalso (mr_test(7, Num)) andalso (mr_test(11, Num));
		Num < 3474749660383 ->
			(mr_test(2, Num)) andalso (mr_test(3, Num)) andalso (mr_test(5, Num))
				andalso (mr_test(7, Num)) andalso (mr_test(11, Num))
				andalso (mr_test(13, Num));
		Num < 341550071728321 ->
			(mr_test(2, Num)) andalso (mr_test(3, Num)) andalso (mr_test(5, Num))
				andalso (mr_test(7, Num)) andalso (mr_test(11, Num))
				andalso (mr_test(13, Num)) andalso (mr_test(17, Num));
		Num < 3825123056546413051 ->
			(mr_test(2, Num)) andalso (mr_test(3, Num)) andalso (mr_test(5, Num))
				andalso (mr_test(7, Num)) andalso (mr_test(11, Num))
				andalso (mr_test(13, Num)) andalso (mr_test(17, Num))
				andalso (mr_test(19, Num)) andalso (mr_test(23, Num));
		Num < 318665857834031151167461 ->
			(mr_test(2, Num)) andalso (mr_test(3, Num))
				andalso (mr_test(5, Num)) andalso (mr_test(7, Num))
				andalso (mr_test(11, Num)) andalso (mr_test(13, Num))
				andalso (mr_test(17, Num)) andalso (mr_test(19, Num))
				andalso (mr_test(23, Num)) andalso (mr_test(29, Num))
				andalso (mr_test(31, Num)) andalso (mr_test(37, Num));
		true ->
			(mr_test(2, Num)) andalso (mr_test(3, Num)) andalso (mr_test(5, Num))
				andalso (mr_test(7, Num)) andalso (mr_test(11, Num)) andalso (mr_test(13, Num))
				andalso (mr_test(17, Num)) andalso (mr_test(19, Num)) andalso (mr_test(23, Num))
				andalso (mr_test(29, Num)) andalso (mr_test(31, Num)) andalso (mr_test(37, Num))
				andalso (mr_test(41, Num))
	end.



mr_test(BaseNum, Num) ->
	PassOrNot = even(Num),
	if
		PassOrNot == false ->
			NumMin1 = Num - 1,
			ModMon = mon(BaseNum, NumMin1, Num),
			if
				ModMon == 1 -> mr_test_main(BaseNum, Num, NumMin1);
				true -> false
			end;
		true -> false
	end.


mon(BaseNum, NumMin1, Num) ->
	BaseNum2 = BaseNum rem Num,
	ModMon = 1,
	mon_main(NumMin1, ModMon, BaseNum2, Num).


mon_main(NumMin1, ModMon, BaseNum2, Num) ->
	if
		NumMin1 =/= 0 ->
			Num_left = NumMin1 div 2,
			Num0 = NumMin1 band 1,
			if
				Num0 == 0 ->
					mon_main(Num_left, ModMon, (BaseNum2 * BaseNum2) rem Num, Num);
				true -> mon_main(Num_left, (ModMon * BaseNum2) rem Num, (BaseNum2 * BaseNum2) rem Num, Num)
			end;
		true ->
			ModMon rem Num
	end.


mr_test_main(BaseNum, Num, NumMin1) ->
	Answer = even(Num),
	if
		Answer == true -> mr_test_even(BaseNum, Num, NumMin1);
		true -> mr_test_odd(BaseNum, Num, NumMin1)
	end.


even(Num) ->
	Num band 1 == 0.


mr_test_even(BaseNum, Num, NumMin1) ->
	NumHalf = NumMin1 div 2,
	ModMon = mon(BaseNum, NumHalf, Num),
	if
		ModMon == NumMin1 -> true;
		ModMon =/= 1 -> fasle;
		true -> mr_test_main(BaseNum, Num, NumHalf)
	end.


mr_test_odd(BaseNum, Num, NumMin1) ->
	ModMon2 = mon(BaseNum, NumMin1, Num),
	if
		(ModMon2 == NumMin1) or (ModMon2 == 1) -> true;
		true -> false
	end.


first_guess(Num) ->
	P_guess = p_guess(Num),
	Num - round(P_guess).


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


down_test(FirstGuess) ->
	FirstGuessMin1 = FirstGuess - 1,
	Answer = xmr_test(FirstGuessMin1),
	if
		Answer == true -> FirstGuessMin1;
		true -> down_test(FirstGuessMin1)
	end.


up_test(FirstGuess, Num) ->
	ThreadNum = erlang:system_info(schedulers_online),
	GapNum = Num - FirstGuess,
	RunTime = GapNum div ThreadNum,
	FirstNum = RunTime * ThreadNum,
	LastNum = GapNum - FirstNum,
	if
		RunTime == 0 ->
			PrimeList = get_prime_list(FirstGuess, GapNum),
			if
				PrimeList =/= [] -> lists:last(lists:sort(PrimeList));
				true -> []
			end;
		true ->
			FirstList = get_prime_list_main(FirstGuess, lists:seq(0, RunTime - 1),
				ThreadNum, []),
			SecondList = get_prime_list(FirstGuess + FirstNum, LastNum),
			PrimeList = FirstList ++ SecondList,
			if
				PrimeList =/= [] -> lists:last(lists:sort(PrimeList));
				true -> []
			end
	end.


get_prime_list(FirstGuess, ThreadNum) ->
	upmap(fun(Off) ->
		GuessUp = FirstGuess + Off,
		Answer = xmr_test(GuessUp),
		if
			Answer == false -> [];
			true -> [GuessUp]
		end
	      end, lists:seq(1, ThreadNum)).


get_prime_list_main(_, [], _, PrimeList) ->
	PrimeList;
get_prime_list_main(FirstGuess, [Start | End], ThreadNum, PrimeList) ->
	GuessUp = FirstGuess + (Start * ThreadNum),
	PrimeList0 = get_prime_list(GuessUp, ThreadNum) ++ PrimeList,
	get_prime_list_main(FirstGuess, End, ThreadNum, PrimeList0).


upmap(F, L) ->
	Parent = self(),
	Ref = make_ref(),
	[receive {Ref, Result} ->
		Result
	 end
		|| _ <- [spawn(fun() -> Parent ! {Ref, F(X)} end) || X <- L]].












	