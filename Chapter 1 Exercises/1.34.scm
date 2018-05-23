#lang sicp

#|
Exercise 1.34. Suppose we define the procedure:

(define (f g)
  (g 2))

Then we have:

(f square)
4
(f (lambda (z) (* z (+ z 1))))
6

What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.
|#

(define (f g)
  (g 2))

(define (square x) (* x x))

(f square)
; 4

(f (lambda (z) (* z (+ z 1))))
; 6

(f f)
; application: not a procedure;
; expected a procedure that can be applied to arguments
;  given: 2
;  arguments...:

; ANSWER: You get the error above because when you go through the process of substitution, (f f) -> (f 2) -> (2 2) then f is no longer a procedure, but rather an integer, which doesn't work.


