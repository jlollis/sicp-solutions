#lang sicp

#|
Exercise 1.38. In 1737, the Swiss mathematician Leonhard Euler published a memoir De
Fractionibus Continuis, which included a continued fraction expansion for e - 2, where e is the base of
the natural logarithms. In this fraction, the N_i are all 1, and the D_i are successively

1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ....

Write a program that uses your cont-frac procedure from exercise 1.37 to approximate e, based on Euler’s expansion. 
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
