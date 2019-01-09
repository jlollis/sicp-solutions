#lang sicp

#|
Exercise 2.10. Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and
comments that it is not clear what it means to divide by an interval that spans zero. Modify Alyssa’s
code to check for this condition and to signal an error if it occurs. 
|#

; From 2.09

(define (width-interval x y)
  (abs
  (* .5
      (- (lower-bound x) (lower-bound y)
      (- (upper-bound x) (upper-bound y))))))

; answer 2.8 : sub-interval - interval subtraction procedure 
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

; from 2.1.4
; add intervals
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; multiply intervals
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (spans-zero? interval)
  (and (>= (upper-bound interval) 0)
       (<= (lower-bound interval) 0)))
 
(define (div-interval x y)
  (if (spans-zero? y)
      (error "div-interval cannot divide by an interval that spans 0")
      (mul-interval x 
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

; answer
(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

; test
(define a (make-interval 22 3))
(define b (make-interval -5 6))

; test
(upper-bound a)
(lower-bound a)
(upper-bound b)
(lower-bound b)

; Test 
; display-interval definition, for formatting output
(define (display-interval a) 
   (display "[") 
   (display (lower-bound a)) 
   (display ",") 
   (display (upper-bound a)) 
   (display "]"))


(display "sub-interval a = ")(display-interval a)
(newline)
(display "sub-interval b = ")(display-interval b)
(newline)
(display "sub-interval a b = ")(display-interval (sub-interval a b))
(newline)
(display "sub-interval b a = ")(display-interval (sub-interval b a))
(newline)
(display "sub-interval a b = ")(display-interval (sub-interval a b))
(newline)

; test with given above
;(add-interval a b)
;(mul-interval a b)
;(div-interval a b)
;(display "sub-interval a b =")(sub-interval a b)

; testing 2.8 - interval subtraction procedure
(display "width = ")(width-interval b a)


(display "mul-interval a = ")(display-interval a)
(newline)
(display "mul-interval b = ")(display-interval b)
(newline)
(display "mul-interval a b = ")(display-interval (mul-interval a b))
(newline)
(display "mul-interval b a = ")(display-interval (mul-interval b a))
(newline)
(display "mul-interval a b = ")(display-interval (mul-interval a b))
(newline)
(display "width = ")(width-interval (mul-interval a a)(mul-interval b b))


(div-interval 

