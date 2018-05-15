#lang sicp

#|
Exercise 1.29. Simpson’s Rule is a more accurate method of numerical integration than the method
illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated
as (See text) where h = (b - a)/n, for some even integer n, and yk = f(a + kh).
(Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n
and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1
(with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above. 
|#

;; defined earlier in chapter section
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; define cube
(define (cube x) (* x x x))

;; define inc 
(define (inc n) (+ n 1))

;; simpson-integral definition
(define (simpson-integral f a b n)
  (define (do-it h)
    (define (y k)
      (f (+ a (* k h))))
    (define (simpson-term k)
      (* (y k)
         (cond ((or (= k 0) (= k n)) 1)
               ((odd? k) 4)
               (else 2))))
    (* (/ h 3) (sum simpson-term 0 inc n)))
  (do-it (/ (- b a) n)))

;; testing
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000) 