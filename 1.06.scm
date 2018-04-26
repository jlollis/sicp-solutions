#lang sicp

; Alyssa P. Hacker doesn't see why if needs to be provided as a special form. ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

; (define (new-if predicate then-clause else-clause)
;   (cond (predicate then-clause)
;         (else else-clause)))

; Eva demonstrates the program for Alyssa:

; (new-if (= 2 3) 0 5)
; 5

; (new-if (= 1 1) 0 5)
; 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:

; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x)
;                      x)))
 
; What happens when Alyssa attempts to use this to compute square roots? Explain.

; Answer: Conditional expressions are special forms - cases where Lisp applies a different evaluation sequence than applicative order, and are evaluated thus: (if <predicate> <consequent> <alternative>)
; To evaluate an if expression, the interpreter starts by evaluating the <predicate> part of the expression. If the <predicate> evaluates to a true value, the interpreter then evaluates the <consequent>
; and returns its value. Otherwise it evaluates the <alternative> and returns its value." (1.1.6)

; So, for conditionals the interpreter uses applicative order to evaluate predicate, only one consequent or alternative is evaluated. When interpreter hits new-if, it uses applicative order again but is still
; to alternative clause, meaning that sqrt-iter will recursively call itself and not terminate. 

