#lang sicp

#|
Exercise 1.31.

a. The sum procedure is only the simplest of a vast number of similar abstractions that can be
captured as higher-order procedures. Write an analogous procedure called product that returns
the product of the values of a function at points over a given range. Show how to define factorial
in terms of product. Also use product to compute approximations to using the formula.

b. If your product procedure generates a recursive process, write one that generates an iterative
process. If it generates an iterative process, write one that generates a recursive process.

|#

#|
;;;Definitions from chapter sections
;;;SECTION 1.3

(define (cube x) (* x x x))

;;;SECTION 1.3.1

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


;; Using sum

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))

;: (sum-cubes 1 10)


(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

;: (sum-integers 1 10)


(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;: (* 8 (pi-sum 1 1000))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

;: (integral cube 0 1 0.01)

;: (integral cube 0 1 0.001)
|#

; returns the product of the values of a function at points over a given range
; recursive process

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; this is new
(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))

; define factorial in terms of product

(define (inc n) (+ n 1))

(define (identity x) x)

(define (factorial x)
  (product-recursive identity 1 inc x))

; test
(factorial 3)
(factorial 5)
(factorial 7)
 
;; approximations using product definition above...uh, this is going to have to wait...

;; [some equation using product to approximate a value]

; returns the product of the values of a function at points over a given range
; rewritten as iterative process

(define (product-iterative term a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a)(* result (term a)))))
  (iter a 1))

  (define (factorial-iterative x)
  (product-iterative identity 1 inc x))

; test iterative solution
(factorial-iterative 3)
(factorial-iterative 5)
(factorial-iterative 7)



