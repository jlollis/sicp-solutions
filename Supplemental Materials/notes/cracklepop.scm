#lang sicp

#|
Write a program that prints out the numbers 1 to 100 (inclusive). If the number is divisible by 3, print Crackle instead of the number. If it's divisible by 5, print Pop. If it's divisible by both 3 and 5, print CracklePop. You can use any language.
|#

(define n 0)
(do ()
    ((= n 101))
            (cond
                ((eq? (modulo n 15) 0) (display "CracklePop\n"))
                ((eq? (modulo n 5) 0) (display "Pop\n"))
                ((eq? (modulo n 3) 0) (display "Crackle\n"))
                (else (map display (list n "\n")))
            )
    (set! n (+ n 1))
)