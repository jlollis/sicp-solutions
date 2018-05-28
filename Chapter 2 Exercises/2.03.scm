#lang sicp

#|
Exercise 2.3.  Exercise 2.3. Implement a representation for rectangles in a plane. (Hint: You may want to make use
of exercise 2.2.) In terms of your constructors and selectors, create procedures that compute the
perimeter and the area of a given rectangle. Now implement a different representation for rectangles.
Can you design your system with suitable abstraction barriers, so that the same perimeter and area
procedures will work using either representation? 
|#

; ANSWER:

; (define make-rectangle ...)

; Testing: compute perimeter and area of given rectangle


;; ANSWER 2.2:

; constructor make-segment
(define (make-segment start end)
  (cons start end))

; selectors
(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

; constructor make-point
(define (make-point x y)
  (cons x y))

; selectors
(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; average definition
(define (average a b)
  (/ (+ a b) 2))

; procedure midpoint-segment
(define (midpoint-segment seg)
  (define (average a b)
    (/ (+ a b) 2))
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (make-point (average (x-point start)
                         (x-point end))
                (average (y-point start)
                         (y-point end)))))
 
; given
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; testing 
(define seg (make-segment (make-point 5 88)
                          (make-point 69 32)))

(print-point (midpoint-segment seg))

; checks out, see https://www.symbolab.com/solver/midpoint-calculator/midpoint%20%5Cleft(5%2C88%5Cright)%20%5Cleft(69%2C32%5Cright)
