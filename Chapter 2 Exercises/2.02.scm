#lang sicp

#|
Exercise 2.2.  Consider the problem of representing line segments in a plane. Each segment is represented as a pair of points: a starting point and an ending point.
Define a constructor 'make-segment' and selectors 'start-segment' and 'end-segment' that define the representation of segments in terms of points. Furthermore, a
point can be represented as a pair of numbers: the x coordinate and the y coordinate. Accordingly, specify a constructor 'make-point' and selectors 'x-point' and
'y-point' that define this representation. Finally, using your selectors and constructors, define a procedure 'midpoint-segment' that takes a line segment as an
argument and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints).

To try your procedures, you'll need a way to print points:

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
|#

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