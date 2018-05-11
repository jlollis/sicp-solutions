#lang scheme
(require racket/trace) 

#|
Exercise 1.25. Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod.
After all, she says, since we already know how to compute exponentials, we could have simply written

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

Is she correct? Would this procedure serve as well for our fast prime tester? Explain. 
|#

;;; Please see 1.25-original-test.scm and 1.25-alyssa-test.scm to compare performance on prime tester.

;;; Alyssa's version is a lot slower, because it computes larger numbers at each step, the original version does not. 

#|

Tested:
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


Original results:
1009 *** 0
1013 *** 0
1019 *** 0
10007 *** 0
10009 *** 0
10037 *** 0
100003 *** 0
100019 *** 0
100043 *** 0
1000003 *** 0
1000033 *** 0
1000037 *** 0
1000000007 *** 0
1000000009 *** 15619
1000000021 *** 0
> 

Alyssa's results:
1009 *** 0
1013 *** 15626
1019 *** 0
10007 *** 140624
10009 *** 109380
10037 *** 75384
100003 *** 4404025
100019 *** 4045313
100043 *** 4337429
1000003 *** 140898389
1000033 *** 142855404
1000037 [...and the little green racket man is still running...] 

|#
