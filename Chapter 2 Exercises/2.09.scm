#lang sicp

#|
Exercise 2.9. The width of an interval is half of the difference between its upper and lower bounds.
The width is a measure of the uncertainty of the number specified by the interval. For some arithmetic
operations the width of the result of combining two intervals is a function only of the widths of the
argument intervals, whereas for others the width of the combination is not a function of the widths of
the argument intervals. Show that the width of the sum (or difference) of two intervals is a function
only of the widths of the intervals being added (or subtracted). Give examples to show that this is not
true for multiplication or division. 
|#

; answer 2.8 : sub-interval - interval subtraction procedure 
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

; from 2.1.4
; add intervals
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; multiply intervals
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; divide intervals
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; answer
(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

; test
(define a (make-interval 2 6))
(define b (make-interval 8 16))

; test
(upper-bound a)
(lower-bound a)
(upper-bound b)
(lower-bound b)

; test with given above
(add-interval a b)
(mul-interval a b)
(div-interval a b)

; testing 2.8 - interval subtraction procedure
(sub-interval a b)
