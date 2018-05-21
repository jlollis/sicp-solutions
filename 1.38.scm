#lang sicp

#|
Exercise 1.38. In 1737, the Swiss mathematician Leonhard Euler published a memoir De
Fractionibus Continuis, which included a continued fraction expansion for e - 2, where e is the base of
the natural logarithms. In this fraction, the N_i are all 1, and the D_i are successively

1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ....

Write a program that uses your cont-frac procedure from exercise 1.37 to approximate e, based on Euler’s expansion.

Euler's expansion: https://en.wikipedia.org/wiki/E_(mathematical_constant)
|#

; from 1.37
(define (cont-frac n d k)
  (define (k-summ i)
    (if (< i k)
        (/ (n i) (+ (d i) (k-summ (+ i 1))))
        (/ (n i) (d i))))
  (k-summ 1))

;(cont-frac (lambda (i) 1.0)
;           (lambda (i) 1.0)
;           10)

; approximate e based on Euler's expansion

(define (n i)
  1)
(define (divides? a b)
  (= 0 (remainder b a)))
(define (d i)
  (if (divides? 3 (+ 1 i))
      (* 2 (/ 3 (+ 1 i)))
      1))

(define e
  (+ 2.0 (cont-frac n d 10))) ; appx to 10 terms in expansion

; enter e in REPL to test
