#lang scheme

; total time:

; red-black paths
(define (rbt n)
 (cond
  ((= n 0) 1)
  ((= n 1) 2)
  (else (+
         (rbt (- n 1))
         (rbt (- n 2)))
  )
 )
)

; tests
(define n 17)  ; maximum computable number
(define (ints n)
 (cond ((< n 0) '())
  (else (cons n
         (ints (- n 1))))))
(define intSeq
 (reverse (ints n)))
intSeq
(map rbt intSeq)

(displayln "Public sequence:")
(define publicSeq
 '(0 1 2 10 20 40)
)
publicSeq
(map rbt publicSeq)
