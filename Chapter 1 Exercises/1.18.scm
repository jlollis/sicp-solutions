#lang scheme
(require racket/trace)

#|
Exercise 1.18. Using the results of exercises 1.16 and 1.17, devise a procedure that generates an
iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a
logarithmic number of steps.
|#

;;; Answer:

(define (even? n)
   (= (remainder n 2) 0))

(define (double x)
   (+ x x))

(define (halve x)
   (/ x 2))

(define (mult-iter a b p)
   (cond ((= 0 b) p)
         ((even? b) (mult-iter (double a) (halve b) p))
         (else (mult-iter a (- b 1) (+ a p)))))

(define (mult a b)
   (mult-iter a b 0))


;;; test using:
(trace mult)
(mult 4 5)
(mult 5 9)
(mult 4 2)
(mult 77 66)

;; Alt 2

 (define (* a b) 
   (define (iter accumulator a b) 
     (cond ((= b 0) accumulator) 
           ((even? b) (iter accumulator (double a) (halve b))) 
           (else (iter (+ accumulator a) a (- b 1))))) 
   (iter 0 a b)) 
  
 ;; Testing
 (trace *)
 (* 2 4) 
 (* 4 0) 
 (* 5 1) 
 (* 7 10) 
  
 ;; Alternate version 3, which makes more complete use of the  
 ;; Russian Peasant Algorithm in footnote 40.  Uses roughly half 
 ;; the steps of the above 

 (define (mult3 a b) 
   (define (mult-iter accumulator b c) 
     (cond ((= c 0) accumulator) 
           ((even? c) (mult-iter accumulator (double b) (halve c))) 
           (else (mult-iter (+ accumulator b) (double b) (- (halve c) 0.5))))) 
   (mult-iter 0 a b)) 
  
 ;; Testing
 (trace mult3)
 (mult3 2 4) 
 (mult3 4 0) 
 (mult3 5 1) 
 (mult3 7 10) 
  