#lang sicp

#|
Exercise 1.27. Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the
Fermat test. That is, write a procedure that takes an integer n and tests whether a^n is congruent to
a modulo n for every a < n, and try your procedure on the given Carmichael numbers.

Footnote 47: Numbers that fool the Fermat test are called Carmichael numbers, and little is known about them
other than that they are extremely rare. There are 255 Carmichael numbers below 100,000,000. The
smallest few are 561, 1105, 1729, 2465, 2821, and 6601. In testing primality of very large numbers
chosen at random, the chance of stumbling upon a value that fools the Fermat test is less than the
chance that cosmic radiation will cause the computer to make an error in carrying out a ‘‘correct’’
algorithm. Considering an algorithm to be inadequate for the first reason but not for the second
illustrates the difference between mathematics and engineering. 
|#

;; Answer:

;; definitions from previous problems in chapter, required by carmichael and congruent defs
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; congruent?, required by carmichael?
(define (congruent? n a)
        (= (expmod a n n) a))

;; carmichael? - tests to see if number is one of the of Carmichael numbers, or numbers that fool Fermat test
(define (carmichael? n)
  (define (iter i)
          (cond ((= i 0) #t)
                ((congruent? n i) (iter (- i 1)))
          (else #f)))
                 (iter (- n 1)))
;; testing
(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)
(newline)
(carmichael? 222)
(carmichael? 42)
(carmichael? 156)