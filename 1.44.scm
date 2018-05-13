#lang sicp

#|
Exercise 1.44 The idea of smoothing a function is an important concept in signal processing. If f is a
function and dx is some small number, then the smoothed version of f is the function whose value at a
point x is the average of f(x - dx), f(x), and f(x + dx). Write a procedure smooth that takes as input a
procedure that computes f and returns a procedure that computes the smoothed f. It is sometimes
valuable to repeatedly smooth a function (that is, smooth the smoothed function, and so on) to
obtained the n-fold smoothed function. Show how to generate the n-fold smoothed function of any
given function using smooth and repeated from exercise 1.43.

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

;;EXERCISE 1.40
;: (newtons-method (cubic a b c) 1)


;;EXERCISE 1.41
;: (((double (double double)) inc) 5)


;;EXERCISE 1.42
;: ((compose square inc) 6)


;;EXERCISE 1.43
;: ((repeated square 2) 5)
