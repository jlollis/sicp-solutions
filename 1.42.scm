#lang sicp

#|
Exercise 1.42. Let f and g be two one-argument functions. The composition f after g is defined to be
the function x f(g(x)). Define a procedure compose that implements composition. For example, if
inc is a procedure that adds 1 to its argument,

((compose square inc) 6)

49
|#
(define (square x)(* x x)) 

(define (compose f g)
  (lambda (x) (f (g x))))

((compose square inc) 6)