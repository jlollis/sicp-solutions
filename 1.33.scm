#lang sicp

#|
Exercise 1.33.

You can obtain an even more general version of accumulate (exercise 1.32) by
introducing the notion of a filter on the terms to be combined. That is, combine only those terms
derived from values in the range that satisfy a specified condition. The resulting
filtered-accumulate abstraction takes the same arguments as accumulate, together with an
additional predicate of one argument that specifies the filter.

Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:

a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a
prime? predicate already written)

b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive
integers i < n such that GCD(i,n) = 1).

|#

;;;SECTION 1.3

(define (cube x) (* x x x))

;;;SECTION 1.3.1

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


;; Using sum

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))

;: (sum-cubes 1 10)


(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

;: (sum-integers 1 10)


(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;: (* 8 (pi-sum 1 1000))


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

;: (integral cube 0 1 0.01)

;: (integral cube 0 1 0.001)
