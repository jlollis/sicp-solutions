#lang sicp

#|
Exercise 1.33.

You can obtain an even more general version of accumulate (exercise 1.32) by
introducing the notion of a filter on the terms to be combined. That is, combine only those terms
derived from values in the range that satisfy a specified condition. The resulting
filtered-accumulate abstraction takes the same arguments as accumulate, together with an
additional predicate of one argument that specifies the filter.

Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:

a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a
prime? predicate already written)

b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive
integers i < n such that GCD(i,n) = 1).

|#

#|
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

;; sum definition from 1.31, reference for answer, change parameters to match accumulate definition given above

#|
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))
|#

;; accumulate-recursive, 1.32

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))

;; sum and product defined as calls to accumulate, 1.32

(define (sum term a next b)
  (accumulate-recursive + 0 term a next b))

(define (product term a next b)
  (accumulate-recursive * 1 term a next b))

;; iterative version of accumulate from 1.32, same process, rewrite 1.31 iterative version with parameters from accumulate definition given in question

#|
(define (product-iterative term a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a)(* result (term a)))))
  (iter a 1))
|#

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

;;; NEW STUFF HERE, 1.33

;; more general solution, filtered-accumulate deinition
(define (filtered-accumulate-recursive filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
      (combiner (term a)
                (filtered-accumulate-recursive filter combiner null-value term (next a) next b))
      (filtered-accumulate-recursive filter combiner null-value term (next a) next b))))

;; a. sum of squares of prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
;; filter using prime? from earlier, now I've got to find it....sheesh, page 53 in online version http://web.mit.edu/alexmv/6.037/sicp.pdf

; prime? definition
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
    (if (= n 1)
      #f ; was getting 1 included in primes? series, this kicks it out
      (= n (smallest-divisor n))))

; defs from earlier in book 
(define (square x) (* x x))

(define (inc n) (+ n 1))

; sum-of-squared-primes
(define (sum-of-squared-primes a b)(filtered-accumulate-recursive prime? + 0 square a inc b))

;; testing a.
; 2^2 + 3^2 + 5+2 + 7^2 = 4 + 9 + 25 + 49 ...
(sum-of-squared-primes 1 5) ; expect 38 - passes
(sum-of-squared-primes 2 6) ; expect 38
(sum-of-squared-primes 1 1) ; expect 0 - passes
(sum-of-squared-primes 2 9) ; expect 87
  
;; b. product of all positive integers less than n,  relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).
;; filter using GCD from earlier, page 52 in online SICP
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)

(define (product-of-relative-primes n)
  (define (relative-prime i)
    (= 1 (gcd i n)))
  (filtered-accumulate-recursive relative-prime * 1 identity 1 inc (- n 1)))

;; testing b
(product-of-relative-primes 1) 
(product-of-relative-primes 2)
(product-of-relative-primes 3)
(product-of-relative-primes 4)
(product-of-relative-primes 5)
(product-of-relative-primes 6)
(product-of-relative-primes 7)
(product-of-relative-primes 8)
(product-of-relative-primes 9)
(product-of-relative-primes 10)
(product-of-relative-primes 11)
(product-of-relative-primes 12)