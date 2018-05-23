#lang sicp

#|
Exercise 1.45. We saw in section 1.3.3 that attempting to compute square roots by naively finding a
fixed point of y x/y does not converge, and that this can be fixed by average damping. The same
method works for finding cube roots as fixed points of the average-damped y x/y
Unfortunately, the process does not work for fourth roots -- a single average damp is not enough to make a
fixed-point search for y x/y converge. On the other hand, if we average damp twice (i.e., use the
average damp of the average damp of y x/y the fixed-point search does converge. Do some
experiments to determine how many average damps are required to compute nth roots as a fixed-point
search based upon repeated average damping of y x/y n-1. Use this to implement a simple procedure
for computing nth roots using fixed-point, average-damp, and the repeated procedure of
exercise 1.43.

Assume that any arithmetic operations you need are available as primitives
|#

(define (average x y)
  (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (square x)(* x x)) 

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)(f ((repeated f (- n 1)) x)))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.00001))
      (< (abs (- v1 v2)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (cube x) (* x x x))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

 (define (log2 x) (/ (log x) (log 2)))

 (define (nth-root n x)
   
 (fixed-point ((repeated average-damp (floor (log2 n)))  
               (lambda (y) (/ x (expt y (- n 1))))) 
              1.0)) 

; checked against this https://www.easycalculation.com/cube-roots-55.html
(nth-root 3 55)


