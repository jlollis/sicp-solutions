#lang sicp

#|
Y combinator:
You are encouraged to solve this task according to the task description, using any language you may know.
In strict functional programming and the lambda calculus, functions (lambda expressions) don't have state and are only allowed to refer to arguments of enclosing functions. This rules out the usual definition of a recursive function wherein a function is associated with the state of a variable and this variable's state is used in the body of the function.

The Y combinator is itself a stateless function that, when applied to another stateless function, returns a recursive version of the function. The Y combinator is the simplest of the class of such functions, called fixed-point combinators.


Task:
Define the stateless Y combinator and use it to compute factorials and Fibonacci numbers from other stateless functions or lambda expressions.

http://rosettacode.org/wiki/Y_combinator#Schemescheme

|#

(define Y
  (lambda (h)
    ((lambda (x) (x x))
     (lambda (g)
       (h (lambda args (apply (g g) args)))))))
 
;; head-recursive factorial
(define fac
  (Y
    (lambda (f)
      (lambda (x)
        (if (< x 2)
            1
            (* x (f (- x 1))))))))
 
;; tail-recursive factorial
(define (fac2 n)
  (letrec ((tail-fac 
             (Y (lambda (f)
                  (lambda (n acc)
                    (if (zero? n)
                        acc
                        (f (- n 1) (* n acc))))))))
    (tail-fac n 1)))
 
(define fib
  (Y
    (lambda (f)
      (lambda (x)
        (if (< x 2)
            x
            (+ (f (- x 1)) (f (- x 2))))))))
 
(display (fac 6))
(newline)
 
(display (fib 6))
(newline)


;;; The usual way to do this, disallowed by the task

(define Y-combinator
  (lambda (h)
    (lambda args (apply (h (Y-combinator h)) args))))