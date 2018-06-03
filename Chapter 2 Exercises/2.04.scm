#lang sicp

#|
Here is an alternative procedural representation of pairs. For this representation, verify
that (car (cons x y)) yields x for any objects x and y.

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the
substitution model of section 1.1.5.) 
|#

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

; verify (car (cons x y) yields x for any objects x or y
(car (cons 3 9))
(car (cons "42" "lol"))
(car (cons "six" 6))

; definition of cdr
(define (cdr z)
  (z (lambda (p q) p)))

(cdr (cons 3 9))
(cdr (cons "42" "lol"))
(cdr (cons "six" 6))

; using subsitution model, verify (car (cons x y)) yields x for any objects x and y:

#|
(car (cons x y))
(car (lambda (m) (m x y)))
((lambda (m) (m x y))(lambda (p q) (p)))
((lambda (p q) p) x y)
x
|#