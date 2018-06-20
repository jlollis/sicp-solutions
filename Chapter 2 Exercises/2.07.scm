#lang sicp

#|
Extended Excercis: Interval Arithmetic (from exercise 2.7 through 2.11)
Exercise 2.7. Alyssa’s program is incomplete because she has not specified the implementation of the
interval abstraction. Here is a definition of the interval constructor:

(define (make-interval a b) (cons a b))

Define selectors upper-bound and lower-bound to complete the implementation. 
|#

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
