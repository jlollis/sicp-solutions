#lang sicp

;; Chapter 1.1 Examples

;; 1.1 The Elements of Programming
;; 1.1.1 Expressions

(+ 137 349)
;486

(- 1000 334)
;666

(* 5 99)
;495

(/ 10 5)
;2

(+ 2.7 10)
;12.7

(+ 21 35 12 7)
;75

(* 25 4 12)
;1200


;; Prefix notation with nested combinations
(+ (* 3 5) (- 10 6))
;19

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))
;57

;; Same expression as above, written in the formatting convention "pretty-printing",
;; where each long combination has operands aligned vertically
(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))
;57

;; 1.1.2 Naming and the Environment

;; "define" example
(define size 2)

size
;2

(* 5 size)
;10

;; More examples of define
(define pi 3.14159)

(define radius 10)

(* pi (* radius radius))
;314.159

(define circumference (* 2 pi radius))

circumference
;62.8318

;; 1.1.3 Evaluating Combinations

;; Evaluating the following expression requires that the evaluation rule be appied to four different
;; combinations in the process known as "tree accumulation", with values percolating upward in tree
(* (+ 2 (* 4 6))
   (+ 3 5 7))
;390

;; Exceptions to general evaluation rule are called special forms, e.g. (define x 3) does not apply
;; define to two arguments, but has its own eval rule.

;; 1.1.4 Compound Procedures

;; general form of a procedure definition:
;; (define (<name> <formal parameters>) <body>)

(define (square x) (* x x))
;square is defined with procedure above

(square 21)
;441

(square (+ 2 5))
;49

(square (square 3))
;81

;(+ (square x) (square y))
;x^2 + y^2

;; defining procedure "sum-of-squares" 
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)
;25

;; sum-of-squares can be used as building block in constructing further procedures, e.g.
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)
;136

;; 1.1.5 The Substitution Model for Procedure Application

;; (f 5)
;; (sum-of-squares (+ a 1) (* a 2))

(sum-of-squares (+ 5 1) (* 5 2))
;136

;; reduces to...
;(+ (square 6) (square 10))
;(+ (* 6 6) (* 10 10))
;(+ 36 100)
;136
;;...which is the "substitution model"

;; 1.1.6 Conditional Expressions and Predicates

;; 1.1.7 Example: Square Roots by Newton’s Method

;; 1.1.8 Procedures as Black-Box Abstraction

;; 1.2 Procedures and the Processes They Generate

;; 1.2.1 Linear Recursion and Iteration

;; 1.2.2 Tree Recursion

;; 1.2.3 Orders of Growth

;; 1.2.4 Exponentiation

;; 1.2.5 Greatest Common Divisors

;; 1.2.6 Example: Testing for Primality

;; 1.3 Formulating Abstractions with Higher-Order Procedures
;; 1.3.1 Procedures as Arguments

;; 1.3.2 Constructing Procedures Using Lambda

;; 1.3.3 Procedures as General Methods

;; 1.3.4 Procedures as Returned Values


