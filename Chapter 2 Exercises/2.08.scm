#lang sicp

#|
Exercise 2.8. Using reasoning analogous to Alyssa’s, describe how the difference of two intervals
may be computed. Define a corresponding subtraction procedure, called sub-interval. 
|#

;(define (add-interval x y)
;  (make-interval (+ (lower-bound x) (lower-bound y))
;                 (+ (upper-bound x) (upper-bound y))))

; sub-interval definition (similar to reasoning in multiply interval -> divide interval
;(define (sub-interval x y)
;  (add-interval x
;                (make-interval (- (upper-bound y))
;                               (- (lower-bound y)))))

; multiply intervals
;(define (mul-interval x y)
;  (let ((p1 (* (lower-bound x) (lower-bound y)))
;        (p2 (* (lower-bound x) (upper-bound y)))
;        (p3 (* (upper-bound x) (lower-bound y)))
;        (p4 (* (upper-bound x) (upper-bound y))))
;    (make-interval (min p1 p2 p3 p4)
;                   (max p1 p2 p3 p4))))

; divide intervals
;(define (div-interval x y)
;  (mul-interval x
;                (make-interval (/ 1.0 (upper-bound y))
;                               (/ 1.0 (lower-bound y)))))

; sub-interval definition
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

; make-interval definition
(define (make-interval a b) (cons a b))

; lower-bound definition
(define (lower-bound i) (car i))

; upper-bound definition
(define (upper-bound i) (cdr i))

; define two intervals a and b
(define a (make-interval 2 6))
(define b (make-interval 8 16))

; Test 
; display-interval definition, for formatting output
(define (display-interval a) 
   (display "[") 
   (display (lower-bound a)) 
   (display ",") 
   (display (upper-bound a)) 
   (display "]"))


(display "sub-interval a = ")(display-interval a)
(newline)
(display "sub-interval b = ")(display-interval b)
(newline)
(display "sub-interval a b = ")(display-interval (sub-interval a b))
(newline)
(display "sub-interval b a = ")(display-interval (sub-interval b a))
(newline)