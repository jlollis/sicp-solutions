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

; From 1.35 - phi calculated 
; fixed point definition given in equations from chapter section. 
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

(define (sqrt x)
  (fixed-point (lambda (y) (/ x y))
               1.0))

; This is 1/phi, for comparison
(/ 1(fixed-point (lambda (x) (+ 1 (/ 1 x))) ; x -> 1 + 1/x
               1.0))

; ANSWER 1.37
; recursive 
(define (cont-frac n d k)
  (define (k-summ i)
    (if (< i k)
        (/ (n i) (+ (d i) (k-summ (+ i 1))))
        (/ (n i) (d i))))
  (k-summ 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

; iterative
(define (cont-frac-iter n d k)
  (define (iter i k-summ)
    (if (= i 0)
        k-summ
        (iter (- i 1) (/ (n i) (+ (d i) k-summ)))))
  (iter (- k 1) (/ (n k) (d k))))

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
