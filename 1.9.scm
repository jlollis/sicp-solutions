#lang sicp

; Exercise 1.9: See 1.9.text for answer. (Its long and I don't feel like commenting out every line...)

; Case 1:
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; Case 2:
; (define (+ a b)
;   (if (= a 0)
;       b
;       (+ (dec a) (inc b))))



; Enter (+ <value> <value>) to test


