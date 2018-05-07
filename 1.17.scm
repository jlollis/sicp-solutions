#lang scheme
(require racket/trace)

#|
Exercise 1.17. The exponentiation algorithms in this section are based on performing exponentiation
by means of repeated multiplication. In a similar way, one can perform integer multiplication by
means of repeated addition. The following multiplication procedure (in which it is assumed that our
language can only add, not multiply) is analogous to the expt procedure:

 (define (* a b)
  (if (= b 0)
  0
  (+ a (* a (- b 1)))))

This algorithm takes a number of steps that is linear in b. Now suppose we include, together with
addition, operations double, which doubles an integer, and halve, which divides an (even) integer
by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic
number of steps.
|#

;;; Answer:

(define (double x) (+ x x))
(define (half x) (/ x 2))

(define (fast-multi a b)
   (cond ((= b 0) 0)
         ((= b 1) a)
         ((even? b) (double (fast-multi a (half b))))
         (else (+ a (fast-multi a (- b 1))))))

;;; test using:
(trace fast-multi)
(fast-multi 4 5)
(fast-multi 5 9)
(fast-multi 4 2)
(fast-multi 77 66)