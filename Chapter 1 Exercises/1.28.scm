#lang sicp

#|
Exercise 1.28. One variant of the Fermat test that cannot be fooled is called the Miller-Rabin test
(Miller 1976; Rabin 1980). This starts from an alternate form of Fermat’s Little Theorem, which states
that if n is a prime number and a is any positive integer less than n, then a raised to the (n - 1)st power
is congruent to 1 modulo n. To test the primality of a number n by the Miller-Rabin test, we pick a
random number a<n and raise a to the (n - 1)st power modulo n using the expmod procedure.
However, whenever we perform the squaring step in expmod, we check to see if we have discovered
a ‘‘nontrivial square root of 1 modulo n,’’ that is, a number not equal to 1 or n - 1 whose square is
equal to 1 modulo n. It is possible to prove that if such a nontrivial square root of 1 exists, then n is not
prime. It is also possible to prove that if n is an odd number that is not prime, then, for at least half the
numbers a < n, computing a^(n-1) in this way will reveal a nontrivial square root of 1 modulo n. (This is
why the Miller-Rabin test cannot be fooled.)

Modify the expmod procedure to signal if it discovers a nontrivial square root of 1, and use this to implement
the Miller-Rabin test with a procedure analogous to fermat-test. Check your procedure by testing various known
primes and non-primes.

Hint: One convenient way to make expmod signal is to have it return 0. 
|#

;; Answer:

(define (square x) (* x x))

(define (expmod-trivial-sqrt? base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let* ((intermediate (expmod-trivial-sqrt? base (/ exp 2) m))
                (squared-mod (remainder (square intermediate) m)))
           (if (and (not (or (= intermediate 1) (= intermediate (- m 1))))
                    (= squared-mod 1))
               0
               squared-mod)))
        (else
         (remainder (* base (expmod-trivial-sqrt? base (- exp 1) m))
                    m))))

(define (miller-rabin n)
  (define (try-it a )
    (= (expmod-trivial-sqrt? a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

                 
;; testing

(miller-rabin 561)
(miller-rabin 1105)
(miller-rabin 1729)
(miller-rabin 2465)
(miller-rabin 2821)
(miller-rabin 6601)
(newline)
(miller-rabin 7)
(miller-rabin 41)
(miller-rabin 79)
(miller-rabin 144)