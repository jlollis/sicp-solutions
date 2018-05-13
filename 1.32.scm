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
