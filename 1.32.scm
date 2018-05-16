#lang sicp

#|
Exercise 1.32.
a. Show that sum and product (exercise 1.31) are both special cases of a still more
general notion called accumulate that combines a collection of terms, using some general
accumulation function:

(accumulate combiner null-value term a next b)

Accumulate takes as arguments the same term and range specifications as sum and product,
together with a combiner procedure (of two arguments) that specifies how the current term is to be
combined with the accumulation of the preceding terms and a null-value that specifies what base
value to use when the terms run out. Write accumulate and show how sum and product can both
be defined as simple calls to accumulate.

b. If your accumulate procedure generates a recursive process, write one that generates an iterative
process. If it generates an iterative process, write one that generates a recursive process.

|#

;; sum definition from 1.31, reference for answer, change parameters to match accumulate definition given above

#|
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))
|#

;; recursive

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))

;; sum and product defined as calls to accumulate

(define (sum term a next b)
  (accumulate-recursive + 0 term a next b))

(define (product term a next b)
  (accumulate-recursive * 1 term a next b))

;; iterative version of accumulate, same process, rewrite 1.31 iterative version with parameters from accumulate definition given in question

#|
(define (product-iterative term a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a)(* result (term a)))))
  (iter a 1))
|#

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))
