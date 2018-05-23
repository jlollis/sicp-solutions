#lang sicp

; Exercise 1.7 The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers.
; Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large
; numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing
; good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess.
; Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?


(define (square x)
   (* x x))

(define (average x y)
   (/ (+ x y)
      2))

(define (good-enough? guess previous-guess)
   (< (abs (- guess previous-guess))
         0.001))

(define (improve guess x)
   (average guess
            (/ x guess)))

(define (sqrt-iter guess previous-guess x)
   (if (good-enough? guess previous-guess)
       guess
       (sqrt-iter (improve guess x)
                  guess
                  x)))

(define (sqrt x)
   (sqrt-iter 1.0 0 x))

;; Enter (sqrt <value>) to test. Looks to be more accurate with larger numbers than smaller numbers.

; (sqrt 16)
; 4.000000000000051

; (sqrt .16)
; 0.4000010362438947

; (sqrt .0000016)
; 0.0014699714534026056

