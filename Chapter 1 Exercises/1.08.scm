#lang sicp

; Exercise 1.8 Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value

;(define (improve guess)
;  (/ (+ (/ x
;           (square guess))
;        (* 2 guess))
;     3))

; Use this formula to implement a cube-root procedure analogous to the square-root procedure


(define (square x)
  (* x x))

(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess))
     0.001))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))


(define (cbrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
  guess
  (cbrt-iter (improve guess x)
             guess
             x)))

(define (cbrt x)
  (cbrt-iter 1.0 0 x))

;; Enter (sqrt <value>) or (cbrt <value>) to test. 
