#lang sicp

#|
Exercise 1.37.
a. An infinite continued fraction is an expression of the form:

(see book)

As an example, one can show that the infinite continued fraction expansion with the N_i and the D_i all
equal to 1 produces 1/phi, where phi is the golden ratio (described in section 1.2.2). One way to
approximate an infinite continued fraction is to truncate the expansion after a given number of terms.
Such a truncation -- a so-called k-term finite continued fraction -- has the form:

(see book)

Suppose that n and d are procedures of one argument (the term index i) that return the N_i and D_i of
the terms of the continued fraction. Define a procedure cont-frac such that evaluating
(cont-frac n d k) computes the value of the k-term finite continued fraction.
Check your procedure by approximating 1/ using:

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

for successive values of k.

How large must you make k in order to get an approximation that is accurate to 4 decimal places?

b. If your cont-frac procedure generates a recursive process, write one that generates an iterative
process. If it generates an iterative process, write one that generates a recursive process. 
|#

;;;SECTION 1.3.3

;; Half-interval method

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))


;: (half-interval-method sin 2.0 4.0)

;: (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
;:                       1.0
;:                       2.0)


;; Fixed points

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


;: (fixed-point cos 1.0)

;: (fixed-point (lambda (y) (+ (sin y) (cos y)))
;:              1.0)


(define (sqrt x)
  (fixed-point (lambda (y) (/ x y))
               1.0))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
