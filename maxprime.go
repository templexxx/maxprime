package main

import (
	"fmt"
	//"os"
	"math"
)

func main() {
	fmt.Println("Please enter the number:")
	var Input int64
	fmt.Scanf("%d", &Input)
	Maxprime := get_maxprime(Input)
	fmt.Println("The max prime is:")
	fmt.Println(Maxprime)
}

func get_maxprime(Input int64) (Maxprime int64) {
	var Is_prime bool = xmr_Test(Input)
	if Is_prime == true {
		Maxprime = Input
		return
	} else {
		Maxprime = guess_maxprime(Input)
		return
	}
}

func guess_maxprime(Input int64) (MaxPrime int64) {
	var Guess int64 = first_guess(Input)
	if Guess == Input {
		MaxPrime = down_guess(Input)
		return
	} else {
		var Up_guess int64 = up_guess(Input, Guess)
		if Up_guess == Guess {
			var Is_prime bool = xmr_Test(Guess)
			if Is_prime == true {
				MaxPrime = Guess
				return
			} else {
				MaxPrime = down_guess(Input)
				return
			}
		} else {
			MaxPrime = Up_guess
			return
		}
	}
}

func xmr_Test(Input int64) bool {
	if Input < 2047 {
		return mrTest(2, Input)
	} else {
		return mrTest(2, Input) &&
			mrTest(7, Input) &&
			mrTest(61, Input)
	}
}

func mrTest(baseNum int64, Input int64) bool {
	if evenOrNot(Input) == false {
		var minus1 int64 = Input - 1
		var modMon int64 = mon(baseNum, minus1, Input)
		if modMon == 1 {
			return mrTestMain(baseNum, Input, minus1)
		} else {
			return false
		}
	} else {
		return false
	}
}

func mrTestMain(baseNum int64, Input int64, minus1 int64) (passOrNot bool) {
	var half int64 = minus1 % 2
	var halfmod int64 = mon(baseNum, half, Input)
	var i, j, k int64
	for i, j, k = 0, half, halfmod; i >= 0; i++ {
		if evenOrNot(i) == false {
			if (halfmod == (Input - 1)) || halfmod == 1 {
				passOrNot = true
				return
			} else {
				passOrNot = false
				return
			}
		} else {
			if k == (Input - 1) {
				passOrNot = true
				return
			} else if k != 1 {
				passOrNot = false
				return
			} else {
				j = j % 2
				k = mon(baseNum, j, Input)
			}
		}
	}
	return passOrNot
}

func evenOrNot(num int64) bool {
	return (num & 1) == 0
}

func mon(baseNum int64, minus1 int64, Input int64) int64 {
	var modBaseNum int64 = baseNum % Input
	var modMon int64 = 1
	mod := monMain(minus1, modMon, modBaseNum, Input)
	return mod
}

func monMain(minus1 int64, modMon int64, modBaseNum int64, Input int64) int64 {
	var numLeft int64 = minus1
	var modFinal int64 = modMon
	j := modFinal
	for i , k := numLeft, modBaseNum; i != 0; i, k = i/2, (k*k)%Input {
		if evenOrNot(i) != true {
			j = (j * k) % Input
		}

	}
	return j % Input
}

func down_guess(firstGuess int64) int64 {
	maxprime := firstGuess - 1
	for i := maxprime; xmr_Test(i) == false; i-- {
		maxprime--
	}
	return maxprime
}

func up_guess(input int64, firstGuess int64) int64 {
	maxprime := firstGuess
	for i := maxprime; i < input; i++ {
		if xmr_Test(i) == true {
			maxprime = i
		}
	}
	return maxprime
}

func first_guess(Input int64) (Guess int64) {
	var Gap float64 = gap(Input)
	Guess = Input - int64(Gap+0.5)
	return
}

func gap(Input int64) float64 {
	Inputf := float64(Input)
	Inputln := math.Log(Inputf)
	var Gap float64 = Inputln /
		(1 +
			(1 / Inputln) +
			(2 / (math.Pow(Inputln, 2))) +
			(6 / (math.Pow(Inputln, 3))) +
			(24 / (math.Pow(Inputln, 4))) +
			(120 / (math.Pow(Inputln, 5))) +
			(720 / (math.Pow(Inputln, 6))) +
			(5040 / (math.Pow(Inputln, 7))) +
			(40320 / (math.Pow(Inputln, 8))))
	return Gap
}
