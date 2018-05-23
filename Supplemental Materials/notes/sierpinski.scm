#lang sicp

; Sierpinski triangle

(define (sierpinski n)
  (for-each
   (lambda (x) (display (list->string x)) (newline))
   (let loop ((acc (list (list #\*))) (spaces (list #\ )) (n n))
     (if (zero? n)
         acc
         (loop
          (append
           (map (lambda (x) (append spaces x spaces)) acc)
           (map (lambda (x) (append x (list #\ ) x)) acc))
          (append spaces spaces)
          (- n 1))))))

(sierpinski 6)

; Sierpinski carpet 

(define (carpet n)
  (define (in-carpet? x y)
    (cond ((or (zero? x) (zero? y))
              #t)
          ((and (= 1 (remainder x 3)) (= 1 (remainder y 3)))
              #f)
          (else
              (in-carpet? (quotient x 3) (quotient y 3)))))
 
  (do ((i 0 (+ i 1))) ((not (< i (expt 3 n))))
    (do ((j 0 (+ j 1))) ((not (< j (expt 3 n))))
      (display (if (in-carpet? i j)
                   #\*
                   #\space)))
    (newline)))

(carpet 4)
