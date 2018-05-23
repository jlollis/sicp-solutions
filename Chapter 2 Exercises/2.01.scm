#lang sicp

#|
Exercise 2.1. Define a better version of make-rat that handles both positive and negative
arguments. Make-rat should normalize the sign so that if the rational number is positive, both the
numerator and denominator are positive, and if the rational number is negative, only the numerator is
negative. 
|#

; From chapter 2.1
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; pairs
(define x (cons 1 2))
(car x) ; 1
(cdr x) ; 2

(define a (cons 1 2))
(define b (cons 3 4))
(define c (cons a b))
(car (car c)) ; 1
(car (cdr c)) ; 3

; representing rational numbers
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))

(define (make-rats n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(print-rat (add-rat one-third one-third)) ; doesn't reduce...

; ANSWER:

(define (make-uber-rat n d)
  (define (neg x)
    (if (< x 0)
        -
        +))
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(print-rat (make-uber-rat -5 6))

