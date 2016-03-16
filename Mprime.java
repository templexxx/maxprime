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
                        maxprime = downTest(firstGuess);
                        return maxprime;
                    }
                } else {
                    return upTestAnswer;
                }
            } else {
                maxprime = downTest(inputNumber);
                return maxprime;
            }
        } else {
            return inputNumber;
        }
    }

    // Prime or Not?
    public boolean xmrTest(long inputNumber) {
        if (inputNumber < 2047) {
            return mrTest(2, inputNumber);
        } else {
            return mrTest(2, inputNumber) &&
                    mrTest(7, inputNumber) &&
                    mrTest(61, inputNumber);
        }
    }

    public boolean mrTest(long baseNum, long inputNumber) {
        if (evenOrNot(inputNumber) == false) {
            long minus1 = inputNumber - 1;
            long modMon = mon(baseNum, minus1, inputNumber);
            if (modMon == 1) {
                return mrTestMain(baseNum, inputNumber, minus1);
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean mrTestMain(long baseNum, long inputNumber, long minus1) {
        long half = minus1 % 2;
        long halfmod = mon(baseNum, half, inputNumber);
        boolean passOrNot = false;
        for (long i = 0, k = halfmod, j = half; i >= 0; i++) {
            if (evenOrNot(i) == false) {
                if ((halfmod == (inputNumber - 1)) || halfmod == 1) {
                    passOrNot = true;
                    break;
                } else {
                    passOrNot = false;
                    break;
                }
            } else {
                if (k == (inputNumber - 1)) {
                    passOrNot = true;
                    break;
                } else if (k != 1) {
                    passOrNot = false;
                    break;
                } else {
                    j = j % 2;
                    k = mon(baseNum, j, inputNumber);
                }
            }
        }
        return passOrNot;
    }

    public boolean evenOrNot(long num) {
        return (num & 1) == 0;
    }

    public long mon(long baseNum, long inputNumberMinus1, long inputNumber) {
        long modBaseNum = baseNum % inputNumber;
        long modMon = 1;
        return monMain(inputNumberMinus1, modMon, modBaseNum, inputNumber);
    }


    public long monMain(long inputNumberMinus1, long modMon, long modBaseNum, long inputNumber) {
        long numLeft = inputNumberMinus1;
        long modFinal = modMon;
        for (long i = numLeft, k = modBaseNum, j = modFinal; i != 0; i = i / 2, k = (k * k) % inputNumber) {
            if (evenOrNot(i) != true) {
                j = (j * k) % inputNumber;
                modFinal = j;
            }
        }
        return modFinal % inputNumber;
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
        long maxPrimeInUpTest = firstGuess;
        for (long i = maxPrimeNow; i < inputNumber; i++) {
            if (xmrTest(i) == true) {
                maxPrimeInUpTest = i;
            }
        }
        return maxPrimeInUpTest;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        long inputNumber = 0;
        System.out.println("输入一个数------>");
        inputNumber = sc.nextLong();
        Mprime maxprime = new Mprime();
        System.out.println("<=" + inputNumber + "的数中最大的素数是------>");
        long startTime = System.nanoTime();
        long mp = maxprime.downTest(inputNumber);
        long endTime = System.nanoTime();
        System.out.println(mp);
        System.out.println("耗时:" + (endTime - startTime));
    }
}
