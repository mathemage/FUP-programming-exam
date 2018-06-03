#lang scheme

; total time:
;  red-black paths = 24 min

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
(displayln "Public sequence:")
(define publicSeq
 '(0 1 2 10 20 40)
)
publicSeq
(map rbt publicSeq)
