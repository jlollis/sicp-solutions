#lang sicp

#|
Exercise 1.26. Louis Reasoner is having great difficulty doing exercise 1.24. His fast-prime? test
seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When
they examine Louis’s code, they find that he has rewritten the expmod procedure to use an explicit
multiplication, rather than calling square:

(define (expmod base exp m)
 (cond ((= exp 0) 1)
       ((even? exp)
        (remainder (* (expmod base (/ exp 2) m)
                      (expmod base (/ exp 2) m))
                   m))
       (else
        (remainder (* base (expmod base (- exp 1) m))
                   m))))

‘‘I don’t see what difference that could make,’’ says Louis. ‘‘I do.’’ says Eva. ‘‘By writing the
procedure like that, you have transformed the (log n) process into a (n) process.’’ Explain. 
|#

#|
Answer:
In the example, Louis rewrote this, from the fast-prime? def in section 1.2.6: 

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

As this, in the question above:

(define (expmod base exp m)
 (cond ((= exp 0) 1)
       ((even? exp)
        (remainder (* (expmod base (/ exp 2) m)
                      (expmod base (/ exp 2) m))
                   m))
       (else
        (remainder (* base (expmod base (- exp 1) m))
                   m))))

This makes two calls to (expmod base (/ exp 2) m) rather than once, as given. The original version uses linear recursion, since
it makes a single call to itself each time the function runs. Louis' version uses binary tree recursion, since it makes two calls
to itself each time it runs, growing exponentially each level down. 

|#
