import java.util.Scanner;
import java.lang.Math;

public class Mprime {
    public long calcMprime(long inputNumber) {
        long maxprime = 0;
        boolean primeOrNot = xmrTest(inputNumber);
        if (primeOrNot != true) {
            long firstGuess = firstGuess(inputNumber);
            if (firstGuess != inputNumber) {
                long upTestAnswer = upTest(inputNumber, firstGuess, firstGuess + 1);
                if (upTestAnswer == firstGuess) {
                    if (xmrTest(firstGuess) == true) {
                        return firstGuess;
                    } else {
                        long maxPrime = downTest(firstGuess);
                        return maxPrime;
                    }
                } else {
                    return upTestAnswer;
                }
            } else {
                long maxPrimeDownTest = downTest(inputNumber);
                return maxPrimeDownTest;
            }
        } else {
            return inputNumber;
        }
    }

    public boolean xmrTest(long inputNumber) {
        if (inputNumber < 2047) {
            return mrTest(2, inputNumber);
        } else {
            return mrTest(2, inputNumber) && mrTest(3, inputNumber) && mrTest(5, inputNumber)
                    && mrTest(7, inputNumber) && mrTest(11, inputNumber) && mrTest(13, inputNumber)
                    && mrTest(17, inputNumber) && mrTest(19, inputNumber) && mrTest(23, inputNumber)
                    && mrTest(29, inputNumber) && mrTest(31, inputNumber) && mrTest(37, inputNumber)
                    && mrTest(41, inputNumber);
        }
    }

    public boolean mrTest(long baseNum, long inputNumber) {
        boolean inputNumberEvenOrNot = evenOrNot(inputNumber);
        if (inputNumberEvenOrNot == false) {
            long inputNumberMinus1 = inputNumber - 1;
            long modMon = mon(baseNum, inputNumberMinus1, inputNumber);
            if (modMon == 1) {
                return mrTestMain(baseNum, inputNumber, inputNumberMinus1);
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean evenOrNot(long num) {
        return (num & 1) == 0;
    }


    public long mon(long baseNum, long inputNumberMinus1, long inputNumber) {
        long baseNum2 = baseNum % inputNumber;
        long modMon = 1;
        return monMain(inputNumberMinus1, modMon, baseNum2, inputNumber);
    }


    public long monMain(long inputNumberMinus1, long modMon, long baseNum2, long inputNumber) {
        long numLeft = inputNumberMinus1;
        long modFinal = modMon;
        for (long i = numLeft, k = baseNum2, j = modFinal; i != 0; i = i / 2, k = (k * k) % inputNumber) {

            if (evenOrNot(i) != true) {
                j = (j * k) % inputNumber;
                modFinal = j;
            }
        }
        return modFinal % inputNumber;
    }

    public long modcommon(long bignumber) {
        return (2 * 2) % bignumber;
    }


    public boolean mrTestMain(long baseNum, long inputNumber, long inputNumberMinus1) {
        if (evenOrNot(inputNumber) == true) {
            return mrTestEven(baseNum, inputNumber, inputNumberMinus1);
        } else {
            return mrTestOdd(baseNum, inputNumber, inputNumberMinus1);
        }
    }

    public boolean mrTestEven(long baseNum, long inputNumber, long inputNumberMinus1) {
        long halfInputNumberMinus1 = inputNumberMinus1 % 2;
        long modMon = mon(baseNum, halfInputNumberMinus1, inputNumber);
        if (modMon == (inputNumber - 1)) {
            return true;
        } else if (modMon != 1) {
            return false;
        } else {
            return mrTestMain(baseNum, inputNumber, halfInputNumberMinus1);
        }

    }

    public boolean mrTestOdd(long baseNum, long inputNumber, long inputNumberMinus1) {
        long modMon = mon(baseNum, inputNumberMinus1, inputNumber);
        if ((modMon == (inputNumber - 1)) || (modMon == 1)) {
            return true;
        } else {
            return false;
        }
    }

    public long firstGuess(long inputNumber) {
        double gapGuess = gapGuess(inputNumber);
        return inputNumber - Math.round(gapGuess);
    }

    public double gapGuess(long inputNumber) {
        double lnInputNumber = Math.log(inputNumber);
        return lnInputNumber / (1 + (1 / lnInputNumber)
                + (2 / (Math.pow(lnInputNumber, 2)))
                + (6 / (Math.pow(lnInputNumber, 3)))
                + (24 / (Math.pow(lnInputNumber, 4)))
                + (120 / (Math.pow(lnInputNumber, 5)))
                + (720 / (Math.pow(lnInputNumber, 6)))
                + (5040 / (Math.pow(lnInputNumber, 7)))
                + (40320 / (Math.pow(lnInputNumber, 8))));
    }

    public long downTest(long firstGuess) {
        long firstGuessMinus1 = firstGuess - 1;
        long maxPrimeInDownTest;
        maxPrimeInDownTest = firstGuess;
        while (xmrTest(firstGuessMinus1) == false) {
            firstGuessMinus1--;
        }
        maxPrimeInDownTest = firstGuessMinus1;
        return maxPrimeInDownTest;
    }


    public long upTest(long inputNumber, long firstGuess, long nextGuessNum) {
        long maxPrimeNow = firstGuess;
        for (long i = maxPrimeNow; i < inputNumber; i++) {
            if (xmrTest(i) == true) {
                maxPrimeNow = i;
            }
        }
        return maxPrimeNow;
    }


    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        long inputNumber = 0;
        System.out.println("输入一个数------>");
        inputNumber = sc.nextLong();
        Mprime maxprime = new Mprime();
        System.out.println("<=" + inputNumber + "的数中最大的素数是------>");
//        long startTime = System.nanoTime();
        long mp = maxprime.calcMprime(inputNumber);
//        long endTime = System.nanoTime();
        System.out.println(mp);
//        System.out.println(endTime - startTime);
    }
}
