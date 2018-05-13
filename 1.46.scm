#lang sicp

#|
Exercise 1.46. Several of the numerical methods described in this chapter are instances of an
extremely general computational strategy known as iterative improvement. Iterative improvement says
that, to compute something, we start with an initial guess for the answer, test if the guess is good
enough, and otherwise improve the guess and continue the process using the improved guess as the
new guess. Write a procedure iterative-improve that takes two procedures as arguments: a
method for telling whether a guess is good enough and a method for improving a guess.
Iterative-improve should return as its value a procedure that takes a guess as argument and
keeps improving the guess until it is good enough. Rewrite the sqrt procedure of section 1.1.7 and
the fixed-point procedure of section 1.3.3 in terms of iterative-improve. 

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
