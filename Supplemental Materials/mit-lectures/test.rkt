#lang sicp

(define (rotate90 pict))
	(lambda (rect)
		(pict (make-rect
				(+vect 	(origin rect)
						(horiz rect))
				(vert rect)
				(scale -1 (horiz rect)))))