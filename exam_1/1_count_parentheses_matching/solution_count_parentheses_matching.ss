#lang scheme

; total time: 60 min

; integers n..0
(define (ints n)
  (cond ((< n 0) '())
        (else (cons n
                    (ints (- n 1))))))
; test
;(ints -2)(ints -1)(ints 0)(ints 1)(ints 2)(ints 10)

; f(n) = count of correctly matched pairs of 'n' parentheses
(define (f n)
  (cond ((<= n 1) 1)
        (else
         (apply + (map (lambda (n1)
                         (*
                          (f n1)             ; f(n1)
                          (f (- (- n 1) n1)) ; f(n2)
                          )    ; such that n1 + n2 = n - 1
                         )
                       (ints (- n 1)))
                ))))

#|(apply + (f 2))
(define n 2)
(define n1s
  (ints (- n 1)))
(define map3
  (map (lambda (n1)
         (*
          1            
          1
          )
         )
       n1s))
(apply + map3)
(define map2
  (map (lambda (n1)
         (*
          n1            
          (- (- n 1) n1)
          )
         )
       n1s))
map2|#
       
#|(apply + '())
(apply + (ints -1))
(apply + (ints 0))
(apply + (ints 1))
(apply + (ints 2))
(ints 3)(apply + (ints 3))|#

(define n 17)  ; maximum computable number
(define intSeq
  (reverse (ints n)))
(define catalanSeq
  '(1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900 2674440 9694845 35357670 129644790 477638700 1767263190 6564120420))
intSeq
(map f intSeq)
catalanSeq