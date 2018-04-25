#lang sicp

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; (enter (+ <value> <value>) to test


