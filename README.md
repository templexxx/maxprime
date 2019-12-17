# maxprime

## Introduction:

>- Get the maximum prime in [3, 3,317,044,064,679,887,385,961,980] at an incredible speed(about several ms).
>
>- My first program,I didn't even know how to print "Hello World!" at that time.
>
>- I keep the code as it was for reminding me "Never forget why you started". 

## Math

[Here](http://www.templex.xyz/blog/10/maxprime.html) is an article written by me.

And [Here](https://www.jianshu.com/p/e90b2c83491b) is another one.

And my steps to get things done:

1. I found I could make Fermat's little theorem being "stronger", and that's called [Miller–Rabin primality test](https://en.wikipedia.org/wiki/Miller–Rabin_primality_test).
2. Then I used [Prime number theorem](https://en.wikipedia.org/wiki/Prime_number_theorem) to get close to the prime.
3. I developed a mod algorithm named it "sexy_mod", now I know it's [Montgomery reduction](https://en.wikipedia.org/wiki/Montgomery_modular_multiplication) :D
4. Done.


## Usage

    (max_prime <Number>)

e.g.

    (max_prime 3317044064679887385961980)

Result: 3317044064679887385961813

It will cost about 30ms.

