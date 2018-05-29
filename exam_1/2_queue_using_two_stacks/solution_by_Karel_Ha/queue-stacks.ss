#lang scheme

; total time: not measured by Karel Ha

(define (push v st)
 (cons v st)
)
(define (pop st)
 (cdr st)
)

; test
(define emptyStack '())
(define stack0
 (push 0 emptyStack)
)
(define stack01
 (push 1 stack0)
)
(define completeStack
 (push 7
  (push 6
   (push 5
    (push 4
     (push 3
      (push 2
       stack01)))))))
(define stack42
 (push 7
  (push 6
   (push 5
    (push 42
     (pop
      (pop
       (pop
        (pop
         completeStack)))))))))
(define inStack
 (push 7
  (push 6
   (push 5
    (push 4
     emptyStack)))))
(define outStack
 (push 3
  (push 2
   (push 1
    (push 0
     emptyStack)))))

emptyStack
stack0
stack01
completeStack
stack42
inStack
outStack
