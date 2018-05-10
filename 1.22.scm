#lang sicp

;;; note: the sicp module is required in racket for this exercise

#|
Exercise 1.22.  Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

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

Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of (n), you should expect that testing for primes around 10,000 should take about 10 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the n prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?
|#

;;; smallest divisor definition, from 1.20
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

;;; prime definition

(define (prime? n) 
  (= n (smallest-divisor n))) 

;;; timed prime test definition given in this question

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

;;; required definitions from previous questions in chapter

(define (square x) (* x x))
  
 (define (divides? a b) 
   (= (remainder b a) 0)) 
  
 (define (search-for-primes first last) 
   (define (search-iter cur last) 
     (if (<= cur last) (timed-prime-test cur)) 
     (if (<= cur last) (search-iter (+ cur 2) last))) 
   (search-iter (if (even? first) (+ first 1) first) 
                (if (even? last) (- last 1) last))) 
  
 (search-for-primes 1000 1019)       ; 1e3 
 (search-for-primes 10000 10037)     ; 1e4 
 (search-for-primes 100000 100043)   ; 1e5 
 (search-for-primes 1000000 1000037) ; 1e6 
  
 ; As of 2008, computers have become too fast to appreciate the time 
 ; required to test the primality of such small numbers. 
 ; To get meaningful results, we should perform the test with numbers 
 ; greater by, say, a factor 1e6.

 (newline) 
 (search-for-primes 1000000000 1000000021)       ; 1e9 
 (search-for-primes 10000000000 10000000061)     ; 1e10 
 (search-for-primes 100000000000 100000000057)   ; 1e11 
 (search-for-primes 1000000000000 1000000000063) ; 1e12 
