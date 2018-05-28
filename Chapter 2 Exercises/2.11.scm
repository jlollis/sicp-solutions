#lang sicp

#|
Exercise 2.11. In passing, Ben also cryptically comments: ‘‘By testing the signs of the endpoints of
the intervals, it is possible to break mul-interval into nine cases, only one of which requires more
than two multiplications.’’ Rewrite this procedure using Ben’s suggestion.
After debugging her program, Alyssa shows it to a potential user, who complains that her program
solves the wrong problem. He wants a program that can deal with numbers represented as a center
value and an additive tolerance; for example, he wants to work with intervals such as 3.5± 0.15 rather
than [3.35, 3.65]. Alyssa returns to her desk and fixes this problem by supplying an alternate
constructor and alternate selectors:

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

Unfortunately, most of Alyssa’s users are engineers. Real engineering situations usually involve
measurements with only a small uncertainty, measured as the ratio of the width of the interval to the
midpoint of the interval. Engineers usually specify percentage tolerances on the parameters of devices,
as in the resistor specifications given earlier.
|#