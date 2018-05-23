#lang scheme

; Iteration examples from http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/Iteration.html#Iteration

(let loop
     ((numbers '(3 -2 1 6 -5))
      (nonneg '())
      (neg '()))
  (cond ((null? numbers)
         (list nonneg neg))
        ((>= (car numbers) 0)
         (loop (cdr numbers)
               (cons (car numbers) nonneg)
               neg))
        (else
         (loop (cdr numbers)
               nonneg
               (cons (car numbers) neg)))))

;; 

(do ((vec (make-vector 5))
     (i 0 (+ i 1)))
  ((= i 5) vec)
  (vector-set! vec i i))

;;

(let ((x '(1 3 5 7 9)))
  (do ((x x (cdr x))
       (sum 0 (+ sum (car x))))
    ((null? x) sum)))

;;