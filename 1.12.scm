#lang sicp

; Exercise 1.12. The following pattern of numbers is called Pascal’s triangle.

;          1
;         1 1
;        1 2 1
;       1 3 3 1
;      1 4 6 4 1

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the
; two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a
; recursive process.

; Answer:

; Enter (pascals-triangle <value>) to test

(define (pascal x y)
  (define current null)
  (define previous null)
  (define table (make-vector (add1 x) 1))
  (for ([i (in-range 1 (add1 x))])
    (set! previous 1)
    (for ([j (in-range 1 i)])
      (set! current (vector-ref table j))
      (vector-set! table j (+ (vector-ref table j) previous))
      (set! previous current)))
  (vector-ref table y))

(define (pascals-triangle n)
  (for ([x (in-range 0 n)])
    (for ([y (in-range 0 (add1 x))])
      (printf "~a " (pascal x y)))
    (newline)))
