#lang sicp

; Exercise 1.10: Ackermann's Function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 1 10)
;1024

(A 2 4)
;65536

(A 3 3)
;65536

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

; Test by entering (f <value>) in REPL area below in DrRacket, (f 9), and then do that for the other procedures as well, e.g. 
; (f 9)
; 18
; (g 6) ...like a G6, yeeah...
; 64
; (h 3)
; ...


; Answer:
;(f n) = 2f
;(g n) = 2^n
;(h n) = 2^(h(n-1))
;(k n) = 5(n^2)


  

