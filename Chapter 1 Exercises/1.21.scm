#lang scheme
(require racket/trace)

#|
Exercise 1.21.  Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.
|#

;;; answer: 199, 1999, 7

(define (smallest-divisor n)
    (define max-divisor (sqrt n))
    (define (next n)
        (if (= n 2)
            3
            (+ 2 n)
        )
    )
    (define (try divisor)
        (if (> divisor max-divisor)
            n
            (if (= (remainder n divisor) 0)
                divisor
                (try (next divisor))
            )
        )
            
    )
    (try 2)
)

;;; entered the values given in question above

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)