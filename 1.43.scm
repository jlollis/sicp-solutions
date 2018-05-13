#lang sicp

#|
Exercise 1.43. If f is a numerical function and n is a positive integer, then we can form the nth
repeated application of f, which is defined to be the function whose value at x is f(f(...(f(x))...)).
For example, if f is the function x x + 1, then the nth repeated application of f is the function x -> x +
n. If f is the operation of squaring a number, then the nth repeated application of f is the function that
raises its argument to the 2^n th power. Write a procedure that takes as inputs a procedure that computes
f and a positive integer n and returns the procedure that computes the nth repeated application of f.
Your procedure should be able to be used as follows:

((repeated square 2) 5)
625

Hint: You may find it convenient to use compose from exercise 1.42:

((compose square inc) 6)
49


|#

;;;SECTION 1.3.4

(define (average-damp f)
  (lambda (x) (average x (f x))))

;: ((average-damp square) 10)

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

;; Newton's method

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.00001)


(define (cube x) (* x x x))

;: ((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))


;; Fixed point of transformed function

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))


;;EXERCISE 1.40
;: (newtons-method (cubic a b c) 1)


