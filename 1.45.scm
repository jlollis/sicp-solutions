#lang sicp

#|
Exercise 1.45. We saw in section 1.3.3 that attempting to compute square roots by naively finding a
fixed point of y x/y does not converge, and that this can be fixed by average damping. The same
method works for finding cube roots as fixed points of the average-damped y x/y
2
. Unfortunately,
the process does not work for fourth roots -- a single average damp is not enough to make a
fixed-point search for y x/y
3
 converge. On the other hand, if we average damp twice (i.e., use the
average damp of the average damp of y x/y
3
) the fixed-point search does converge. Do some
experiments to determine how many average damps are required to compute nth roots as a fixed-point
search based upon repeated average damping of y x/y
n-1 . Use this to implement a simple procedure
for computing nth roots using fixed-point, average-damp, and the repeated procedure of
exercise 1.43. Assume that any arithmetic operations you need are available as primitives

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
