#lang sicp

#|
Exercise 2.5. Show that we can represent pairs of nonnegative integers using only numbers and
arithmetic operations if we represent the pair a and b as the integer that is the product
(2^a)(3^b). Give the corresponding definitions of the procedures cons, car, and cdr.
|#

(define (fast-expt b n) 
  (define (iter a b n) 
    (cond ((= n 0) a) 
          ((even? n) (iter a (square b) (/ n 2))) 
          (else (iter (* a b) b (- n 1))))) 
  (iter 1 b n)) 
  
(define (square x) (* x x))

; cons = "construct", takes two arguments and returns list constructed from those two arguments
(define (cons a b)
  (* (fast-expt 2 a)(fast-expt 3 b)))

(cons 2 3)

; corresponding def of car, gets first element
; car = "Contents of Address Register", returns first item in list.

(define car (cons 2 3))

; corresponding def of cdr, gets second element and all subsequent items in list
; cdr = "Contents of Decrement part of Register" returns second and all subsequent items in list

; ??