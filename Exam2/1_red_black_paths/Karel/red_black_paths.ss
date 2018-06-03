#lang scheme

; total time:
;  red-black paths = 24 min

; red-black paths
(define (rbp n)
 (cond
  ((= n 0) 1)
  ((= n 1) 2)
  (else (+
         (rbp (- n 1))
         (rbp (- n 2)))
  )
 )
)

; tests
(displayln "Public sequence:")
(define publicSeq
 '(0 1 2 10 20 40)
)
publicSeq
(map rbp publicSeq)
