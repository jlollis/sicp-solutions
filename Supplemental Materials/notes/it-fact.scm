#lang sicp

; Factorials
; http://rosettacode.org/wiki/Factorial#Recursive_69

; Recursive factorial
(define (factorial n)
  (if (<= n 0)
      1
      (* n (factorial (- n 1)))))

(factorial 5)

; Tail-recursive factorial; effectively iterative
(define (tail-recursive-factorial n)
  (let loop ((i 1)
             (accum 1))
    (if (> i n)
        accum
        (loop (+ i 1) (* accum i)))))

(tail-recursive-factorial 5)

; Iterative factorial

(define (iterative-factorial n)
  (do ((i 1 (+ i 1))
       (accum 1 (* accum i)))
      ((> i n) accum)))


(iterative-factorial 5)

; https://en.wikibooks.org/wiki/Scheme_Programming
; https://en.wikibooks.org/wiki/Scheme_Programming/Looping

(define !-it
  (lambda (n current)
    (if (= n 0)
        current
        (!-it (- n 1) (* n current))
    )
  )
)

(!-it 5 1)



