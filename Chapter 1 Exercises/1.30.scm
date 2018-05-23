#lang sicp

#|

Exercise 1.30. The sum procedure above generates a linear recursion. The procedure can be rewritten
so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in
the following definition:
(define (sum term a next b)
 (define (iter a result)
   (if <??>
       <??>
 (iter <??> <??>)))
 (iter <??> <??>))

|#

#|
;; From 1.29:
;; linear recursive
;; defined earlier in chapter section
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; define cube
(define (cube x) (* x x x))

;; define inc 
(define (inc n) (+ n 1))

;; simpson-integral definition
(define (simpson-integral f a b n)
  (define (do-it h)
    (define (y k)
      (f (+ a (* k h))))
    (define (simpson-term k)
      (* (y k)
         (cond ((or (= k 0) (= k n)) 1)
               ((odd? k) 4)
               (else 2))))
    (* (/ h 3) (sum simpson-term 0 inc n)))
  (do-it (/ (- b a) n)))

;; testing
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
|#

;; Answer 1.30:
;; iterative 
;; created from expression in question above and first definition from chapter

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;; define cube
(define (cube x) (* x x x))

;; define inc 
(define (inc n) (+ n 1))

;; simpson-integral definition
(define (simpson-integral f a b n)
  (define (do-it h)
    (define (y k)
      (f (+ a (* k h))))
    (define (simpson-term k)
      (* (y k)
         (cond ((or (= k 0) (= k n)) 1)
               ((odd? k) 4)
               (else 2))))
    (* (/ h 3) (sum simpson-term 0 inc n)))
  (do-it (/ (- b a) n)))

;; testing
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000) 