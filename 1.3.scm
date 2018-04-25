#lang sicp

;; Exercise 1.3

 (define (square x) (* x x)) 
  
 (define (sumsquares x y) (+ (square x) (square y))) 
  
 (define (sqsumlargest a b c) 
     (cond  
         ((and (>= a c) (>= b c)) (sumsquares a b)) 
         ((and (>= b a) (>= c a)) (sumsquares b c)) 
         ((and (>= a b) (>= c b)) (sumsquares a c))))

; Enter (sqsumlargest <val_1> <val_2> <val_3>) in terminal for result
