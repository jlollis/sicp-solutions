#lang sicp

#|
Exercise 1.39
Define a procedure (tan-cf x k) that computes an approximation to the tangent function based on Lambert’s formula.
K specifies the number of terms to compute, as in exercise 1.37. 

|#

; from exercise 1.37

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)
