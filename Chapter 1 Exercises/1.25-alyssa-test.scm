#lang sicp

#|
Exercise 1.25. Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod.
After all, she says, since we already know how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

Is she correct? Would this procedure serve as well for our fast prime tester? Explain. 
|#

;;; TESTING ALYSSA'S VERSION OF 1.24 FOR Q 1.25

;;; square

(define (square x) (* x x))

;;; divides?

;(define (divides? a b)
;  (= (remainder b a) 0))

;; fast-prime? from 1.2.6 text

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; Alyssa's version

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; original version

#|
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

|#

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


;;; smallest-divisor definition, from 1.20

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

;;; prime?

(define (prime? n) 
  (= n (smallest-divisor n))
(fast-prime? n 100))

;;; timed prime test definition, from 1.22

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009) 
(timed-prime-test 1013) 
(timed-prime-test 1019) 
(timed-prime-test 10007) 
(timed-prime-test 10009) 
(timed-prime-test 10037) 
(timed-prime-test 100003) 
(timed-prime-test 100019) 
(timed-prime-test 100043) 
(timed-prime-test 1000003) 
(timed-prime-test 1000033) 
(timed-prime-test 1000037)
(timed-prime-test 1000000007) 
(timed-prime-test 1000000009) 
(timed-prime-test 1000000021) 

;;; Answer: Time expected is double, as we know from the previous question, and this is what we find in the REPL when testing.
