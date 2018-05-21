#lang sicp

#|
Exercise 1.40. Define a procedure cubic that can be used together with the newtons-method
procedure in expressions of the form:

(newtons-method (cubic a b c) 1)

to approximate zeros of the cubic (x^3) + (ax^2) + bx + c.
|#

(define (cube x) (* x x x))
;; define average
 (define (average x y) 
   (/ (+ x y) 2.0))

;; define fixed-point
(define tolerance 0.000000000000000000000001)

(define (fixed-point f first-guess) 
  (define (close-enough? v1 v2) 
    (< (abs (- v1 v2)) tolerance)) 
  (define (try guess) 
    (let ((next (f guess))) 
      (if (close-enough? guess next) 
          next 
          (try next)))) 
  (try first-guess)) 

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
(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

;: ((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

; (define (sqrt-2 x)
; (newtons-method (lambda (y) (- (square y) x))
;                  1.0)


;; Fixed point of transformed function

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt-3 x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(define (sqrt-4 x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

#|
Exercise 1.40. Define a procedure cubic that can be used together with the newtons-method
procedure in expressions of the form:

(newtons-method (cubic a b c) 1)

to approximate zeros of the cubic (x^3) + (ax^2) + bx + c.
|#

(define (square x) (* x x))

;(define (cube x)(* x x x))

(define (cubic a b c)
  (lambda (x)(+ (cube x))(* a (square x))(* b x)(+ c)))

; not working in test... :(
(newtons-method (cubic 5 4 6) 1)








