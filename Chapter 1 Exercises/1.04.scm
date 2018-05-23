#lang sicp

;; Exercise 1.4

;; Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
  
;; If b is greater than zero, a and b are added; if b is negative, then a - |-b|

(a-plus-abs-b 6 9)
;15

(a-plus-abs-b 7 -55)
;62

(a-plus-abs-b 9 0)
;9