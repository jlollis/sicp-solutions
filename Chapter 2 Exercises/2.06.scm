#lang sicp

#|
Exercise 2.6. In case representing pairs as procedures wasn’t mind-boggling enough, consider that, in
a language that can manipulate procedures, we can get by without numbers (at least insofar as
nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who
invented the λ calculus.

Define one and two directly (not in terms of zero and add-1).(Hint: Use substitution to evaluate
(add-1 zero)). Give a direct definition of the addition procedure + (not in terms of repeated
application of add-1).

See "The Genius of Alonzo Church (rerun) – Good Math, Bad Math.pdf", which I have available here:
https://github.com/jlollis/sicp-solutions/blob/master/Supplemental%20Materials/papers/The%20Genius%20of%20Alonzo%20Church%20(rerun)%20%E2%80%93%20Good%20Math%2C%20Bad%20Math.pdf

|#

#|
;Part 1
;Okay, this is a little bit tougher than the previous questions. I'm still not sure I get this...

(define zero
  (lambda (f)
    (lambda (x) x)))
;this is zero

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))
;this is one (adds one to zero)

;if you test:
zero
;you get:
#<procedure:zero>
;so this doesn't evaluate zero, just showing how church numerals work in a general way...which means that you can't test either of the above or our answers.

I had to do some research on lambda calculus in order to understand how Church numerals work:

From http://scienceblogs.com/goodmath/2006/08/30/church-numerals-rerun/

"In Church numerals, all numbers are functions with two parameters:
* Zero ≡ *λ s z . z*
* One ≡ *λ s z . s z*
* Two ≡ *λ s z . s (s z)*
* Three ≡ *λ s z . s (s (s z))*
* Any natural number “n”, is represented by a Church numeral which is a function which applies its first parameter to its second parameter “n” times.
A good way of understanding this is to think of “z” as being a a name for a zero-value, and “s” as a name for a
successor function. So zero is a function which just returns the “0” value; one is a function which applies the
successor function once to zero; two is a function which applies successor to the successor of zero, etc. It’s just the Peano arithmetic definition of numbers transformed into lambda calculus."

(define zero
  (lambda (f)
    (lambda (x) x)))


(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

; which reduces to:
(define one)
  (lambda (f)
    (lambda (x)
      (f x)))

; Using Church Numerals function explanation from article above,
(define two)
  (lambda (f)
    (lambda (x)
      (f (f x))))

;Okay, so now know that:

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

;Part 2
Continued, from http://scienceblogs.com/goodmath/2006/08/30/church-numerals-rerun/
"But the really cool thing is what comes next. If we want to do addition, x + y, we need to write a function with four parameters;
the two numbers to add; and the “s” and “z” values we want in the resulting number:

add ≡ *λ s z x y . x s (y s z)*"

; given above
(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

We need two additional parameters added to given add-1 definition, for total of 4 parameters, the third is the number being added to n,
the fourth is that number applied to result, following explanation from article above

Which is:

(define (add-church n m) 
  (lambda (f)
    (lambda (x)
      ((n f) (m f) x))))
  
|#

;Part One
(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

;Part Two
(define (add-church n m) 
  (lambda (f)
    (lambda (x)
      ((n f) (m f) x))))
  