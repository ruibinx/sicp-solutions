#lang racket
(require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(define (split op1 op2)
  (lambda(painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split op1 op2) painter (- n 1))))
          (op1 painter (op2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 10))
(paint (up-split einstein 10))