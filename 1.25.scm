#lang scheme
(require racket/trace) 

#|
Exercise 1.25. Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod.
After all, she says, since we already know how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

Is she correct? Would this procedure serve as well for our fast prime tester? Explain. 
|#

;; Required definitions for square and fast-expt

 (define (square m)  
   (display "square ")(display m)(newline) 
   (* m m))

; (define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Alyssa P. Hacker's expmod version 

(define (expmod-alyssa base exp m)
  (remainder (fast-expt base exp) m))

(trace expmod-alyssa)
(expmod-alyssa 5 101 101) 

;; Original expmod solution from 1.2.6

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

; testing fast-expt version
(trace expmod)
(expmod 5 101 101)

;;; Alyssa's version computes larger numbers at each step, the original version does not. The original version would be faster for the fast-prime tester, because you would expect to be testing larger numbers where this could cause an issue. 
