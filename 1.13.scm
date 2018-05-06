#lang scheme

;;; Exercise 1.13. Prove that Fib(n) is the closest integer to n / 5, where = (1 + 5)/2. Hint: Let =(1 - 5)/2.
;;; Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (n -n)/ 5.

;;; Answer: With thanks to Bill the Lizard, http://www.billthelizard.com/2009/12/sicp-exercise-113-fibonacci-and-golden.html

(define phi
   (/ (+ 1 (sqrt 5)) 2))

(define (^ base exponent)
   (define (*^ exponent acc)
       (if (= exponent 0)
           acc
           (*^ (- exponent 1) (* acc base))))
   (*^ exponent 1))

(define (f n)
   (/ (^ phi n) (sqrt 5)))

;;; The following output shows that this function does track closely with the Fibonacci sequence.

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)
(f 7)
(f 8)

#| Each term is within 1/2 of the corresponding term of Fib(n), which is what we're asked to prove. This is only a small amount of empirical evidence, though, which is a far cry from proof. It does show that what we're asked to prove is at least reasonable, though. (It's always a good idea to show that an assertion is at least reasonable before you go about trying to prove it.)

The inductive proof:

As the hint recommends, let's start by proving inductively that

Fib(n) = (φn - ψn) / √5

For the base cases we'll show that the left-hand side of the equation above is equal to the right-hand side for n = 0, n = 1, and n = 2.

On the Left-hand side we have:

Fib(0) = 0
Fib(1) = 1
Fib(2) = Fib(1) + Fib(0)
= 1 + 0
= 1

On the Right-hand side we have:

for n = 0
(φn - ψn) / √5 = (φ0 - ψ0) / √5
= (1 - 1) / √5
= 0 / √5
= 0

for n = 1
(φn - ψn) / √5 = (φ1 - ψ1) / √5
= ((1 + √5)/2) - ((1 - √5)/2) / √5
= (1/2 + √5/2) - (1/2 - √5/2) / √5
= (1/2 + √5/2 - 1/2 + √5/2) / √5
= (√5/2 + √5/2) / √5
= (2 * √5/2) / √5
= √5 / √5
= 1

for n = 2
(φn - ψn) / √5 = (φ2 - ψ2) / √5
= ((φ + 1) - (ψ + 1)) / √5
= (((1 + √5)/2 + 1) - ((1 - √5)/2 + 1)) / √5
= ((1 + √5)/2 + 1 - (1 - √5)/2 - 1) / √5
= ((1 + √5)/2 - (1 - √5)/2) / √5
= ((1 + √5) - (1 - √5)) / 2 / √5
= (1 + √5 - 1 + √5) / 2 / √5
= (√5 + √5) / 2 / √5
= (2 * √5) / 2 / √5
= √5 / √5
= 1

So far, so good. Now for the inductive step. If we assume that both of the following are true:

Fib(n) = (φn - ψn) / √5
Fib(n-1) = (φn-1 - ψn-1) / √5

does it follow that

Fib(n+1) = (φn+1 - ψn+1) / √5

is true also? Let's find out!

We'll start from the defining recurrence relation of the Fibonacci sequence and see if the two assumptions above can lead us to the correct conclusion. Remember that we also have the properties of φ and ψ that were introduced at the beginning at our disposal.

Fib(n+1) = Fib(n) + Fib(n-1)
= (φn - ψn) / √5 + (φn-1 - ψn-1) / √5
= ((φn - ψn) + (φn-1 - ψn-1)) / √5
= (φn - ψn + φn-1 - ψn-1) / √5
= (φn + φn-1 - ψn - ψn-1) / √5
= ((φn + φn-1) - (ψn + ψn-1)) / √5
= (φn+1 * (φ-1 + φ-2) - ψn+1 * (ψ-1 + ψ-2)) / √5
= (φn+1 * φ-1 * (1 + φ-1) - ψn+1 * ψ-1 * (1 + ψ-1)) / √5
= (φn+1 * 1/φ * (1 + 1/φ) - ψn+1 * 1/ψ * (1 + 1/ψ)) / √5
= (φn+1 * 1/φ * (φ) - ψn+1 * 1/ψ * (ψ)) / √5
= (φn+1 - ψn+1) / √5

In the 10th step of the transformation above I used the following properties of φ and ψ to do substitutions:

1/φ + 1 = φ
1/ψ + 1 = ψ

This concludes the inductive proof from the hint, but where does that leave us? How does that help us prove that Fib(n) is the closest integer to φn/√5?

One proof leads to another

Let's rearrange the equation just a bit before continuing on.

Fib(n) = (φn - ψn) / √5
Fib(n) = φn/√5 - ψn/√5
Fib(n) - φn/√5 = ψn/√5

I did this bit of manipulation because we're trying to prove something about the relationship between Fib(n) and φn/√5. Specifically, we're trying to prove that the difference between them is always less than 1/2. In its current form, all that we have left to prove is that

ψn/√5 ≤ 1/2
or
ψn ≤ √5/2

Since ψ is defined to be (1 - √5)/2, we can simply evaluate it to find that

ψ = -0.618304...

Since the n in Fib(n) is always going to be an integer and

n ≥ 0

will always be true, and
ψ < 1

we know that
ψn ≤ 1

for all non-negative integer values of n.

We can also simply evaluate √5/2.

√5/2 = 1.118...

Since
ψn ≤ 1
and
√5/2 > 1

it's pretty clear that

ψn ≤ √5/2

and therefore

Fib(n) is the closest integer to φn/√5.

QED |#