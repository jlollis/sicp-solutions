#lang sicp

#|
Exercise 2.6. In case representing pairs as procedures wasn’t mind-boggling enough, consider that, in
a language that can manipulate procedures, we can get by without numbers (at least insofar as
nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who
invented the λ calculus.

Define one and two directly (not in terms of zero and add-1).(Hint: Use substitution to evaluate
(add-1 zero)). Give a direct definition of the addition procedure + (not in terms of repeated
application of add-1).
|#

; Okay, this is a little bit tougher than the previous questions. I'm still not sure I get this...

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

; Define one and two directly, not in terms of zero and add-1

; zero
; #<procedure:zero>
; doesn't evaluate zero, just showing relationships here

  (define (multiply number1 number2)
    (lambda (f)
      (number1 (lambda (x) ((number2 f) x)))))
  
  (define (exponentiate base exponent)
    (exponent base))

(multiply 2 2)