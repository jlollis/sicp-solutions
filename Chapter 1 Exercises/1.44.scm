#lang sicp

#|
Exercise 1.44 The idea of "smoothing" a function is an important concept in signal processing.

If f is a function and dx is some small number, then the smoothed version of f is the function whose value at a point x is the average of f(x - dx), f(x), and f(x + dx).

Write a procedure smooth that takes as input a procedure that computes f and returns a procedure that computes the smoothed f.

It is sometimes valuable to repeatedly smooth a function (that is, smooth the smoothed function, and so on) to obtain the "n-fold smoothed function".
Show how to generate the n-fold smoothed function of any given function using 'smooth' and 'repeated' from exercise 1.43.

|#

; from 1.42

(define (square x)(* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6)
;returns 49

; from 1.43
; if f is the function x x + 1, then the nth repeated application of f is the function x -> x + n
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

((repeated square 2) 2)

; 1.44

; define smooth: if f is a function and dx is some small number, then the smoothed version of f is the function whose value at a point x is the average of f(x - dx), f(x), and f(x + dx).

(define dx .000001)

(define (smooth f dx)
  (lambda (x)
    (/ (+ (f (- x dx))
         (f x)
         (f (+ x dx))
     3))))

; define n-fold-smooth: repeatedly smooth a function, that is, smooth the smoothed function, and so on...
(define (n-fold-smooth f n)
  (repeated smooth n) f)

; generates the n-fold smoothed function of any given function using 'smooth' and 'repeated'
(n-fold-smooth ((repeated square 2) 2) 5)