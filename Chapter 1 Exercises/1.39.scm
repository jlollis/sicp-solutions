#lang sicp

#|
Exercise 1.39
Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert’s formula.

K specifies the number of terms to compute, as in exercise 1.37.

Note: check out the canvas animation here: https://www.mathopenref.com/trigtangent.html

|#

;; from 1.37
(define (cont-frac n d k)
  (define (k-summ i)
    (if (< i k)
        (/ (n i) (+ (d i) (k-summ (+ i 1))))
        (/ (n i) (d i))))
  (k-summ 1))

;(cont-frac (lambda (i) 1.0)
;           (lambda (i) 1.0)
;           10)

;; approximation to tangent function based on Labert's formula 
(define (square x)(* x x))
  
(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1) x (- (square x))))
             (lambda (i)
               (- (* i 2) 1.0))
             k))

;; testing with (tan-cf x k) where k is number of terms in series, using ten as baseline, to approximate tan (x)
;; against sicp scheme's built-in tan function 
(display "test 1")(newline)
(tan-cf 1 10)
(tan 1)
(display "test 2")(newline)
(tan-cf 2 10)
(tan 2)
(display "test 3")(newline)
(tan-cf 3 10)
(tan 3)
(display "test 4")(newline)
(tan-cf 4 10)
(tan 4)
(display "test 5")(newline)
(tan-cf 5 10)
(tan 5)
(display "test 6")(newline)
(tan-cf 6 10)
(tan 6)
(display "test 7")(newline)
(tan-cf 7 10)
(tan 7)
(display "test 8")(newline)
(tan-cf 8 10)
(tan 8)
(display "test 9")(newline)
(tan-cf 9 10)
(tan 9)
(display "test 10")(newline)
(tan-cf 100 1000)
(tan 100)
; starts to break down around (tan-cf 7 10), so we should increase our terms for greater accuracy