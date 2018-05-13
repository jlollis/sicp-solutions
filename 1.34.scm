#lang sicp

#|
Exercise 1.34. Suppose we define the procedure:

(define (f g)
  (g 2))

Then we have:

(f square)
4
(f (lambda (z) (* z (+ z 1))))
6

What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.
|#

;;;SECTION 1.3.2

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))

(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))

(define (plus4 x) (+ x 4))

(define plus4 (lambda (x) (+ x 4)))

;: ((lambda (x y z) (+ x y (square z))) 1 2 3)


;; Using let

(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y)) 
            (- 1 y)))

(define (f x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y))
   (- 1 y)))

(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))

;: (+ (let ((x 3))
;:      (+ x (* x 10)))
;:    x)

;: (let ((x 3)
;:       (y (+ x 2)))
;:   (* x y))

(define (f x y)
  (define a (+ 1 (* x y)))
  (define b (- 1 y))
  (+ (* x (square a))
     (* y b)
     (* a b)))


;;EXERCISE 1.34
(define (f g)
  (g 2))

;: (f square)

;: (f (lambda (z) (* z (+ z 1))))