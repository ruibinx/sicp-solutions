#lang racket
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-map-tree tree)
  (map (lambda(sub-tree)
         (if (pair? sub-tree)
             (square-map-tree sub-tree)
             (* sub-tree
                sub-tree)))
       tree))


(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(square-map-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))