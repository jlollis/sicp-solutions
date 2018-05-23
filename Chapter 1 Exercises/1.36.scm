#lang sicp

#|
Exercise 1.36.
Modify fixed-point so that it prints the sequence of approximations it generates,
using the newline and display primitives shown in exercise 1.22.

Then find a solution to x^(x) = 1000 by finding a fixed point of x -> log(1000)/log(x).
Use Scheme’s primitive log procedure, which computes natural logarithms.
Compare the number of steps this takes with and without average damping.

Note: you cannot start fixed-point with a guess of 1, as this would cause division by log(1) = 0.
|#

;; ANSWER:

; fixed-point definition given in chapter section, modified to display guess on new line
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess) ; display guess
    (newline)       ; newline
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; finds solution to x^(x) = 1000 by finding a fixed point of x -> log(1000)/log(x)
(fixed-point (lambda (x) (/ (log 1000)(log x))) ; x -> log(1000)/log(x)
          2) ; you can't start fixed-point with a guess of 1, as this would cause division by log(1) = 0. [see above]

; Average damping covered in lecture 2A
(define (sqrt x)
	(fixed-point
		(average-damp (lambda (y)(/ x y)))
		1))

(define average-damp
	(lambda (f)
		(lambda (x) (average (f x) x))))

(define (average x y)
  (/ (+ x y) 2))

(fixed-point (lambda (x)(average x (/ (log 1000)(log x)))) ; ; use average-damp process above by modifying fixed-point like average-damp above, in adding average x
          2)

; Applying average damp to MIT scheme native log function takes about a third as many steps to complete than without, as seen below.

#| Prints:
2
9.965784284662087
3.004472209841214
6.279195757507157
3.759850702401539
5.215843784925895
4.182207192401397
4.8277650983445906
4.387593384662677
4.671250085763899
4.481403616895052
4.6053657460929
4.5230849678718865
4.577114682047341
4.541382480151454
4.564903245230833
4.549372679303342
4.559606491913287
4.552853875788271
4.557305529748263
4.554369064436181
4.556305311532999
4.555028263573554
4.555870396702851
4.555315001192079
4.5556812635433275
4.555439715736846
4.555599009998291
4.555493957531389
4.555563237292884
4.555517548417651
4.555547679306398
4.555527808516254
4.555540912917957
4.555532270803653
2
5.9828921423310435
4.922168721308343
4.628224318195455
4.568346513136242
4.5577305909237005
4.555909809045131
4.555599411610624
4.5555465521473675
4.555537551999825
|#

#|

;;; FROM SECTION 1.3.3

;; Half-interval method

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))


;: (half-interval-method sin 2.0 4.0)

;: (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
;:                       1.0
;:                       2.0)


;; Fixed points

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


;: (fixed-point cos 1.0)

;: (fixed-point (lambda (y) (+ (sin y) (cos y)))
;:              1.0)


(define (sqrt x)
  (fixed-point (lambda (y) (/ x y))
               1.0))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

|#