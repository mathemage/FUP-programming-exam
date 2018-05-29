#lang scheme

; total time: not measured by Karel Ha

(define (push v st)
 (cons v st))
(define (top st)
 (cond ((null? st) '())
       (else (car st))
 )
)
(define (pop st)
 (cdr st))

(define (inStackOutStack ist ost)
 (list ist ost))
(define (getInStack q)
 (car q)
)
(define (getOutStack q)
 (cadr q)
)


; test - stacks
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
(define listOfStacks
 (list
    emptyStack
    stack0
    stack01
    completeStack
    stack42
    inStack
    outStack))
(displayln "Stacks: ")
(map displayln listOfStacks)
(displayln "Their tops: ")
(map (lambda (st) (displayln (top st))) listOfStacks)

; test - queues
(define q1
 (inStackOutStack inStack outStack))
(define q2
 (inStackOutStack emptyStack outStack))
(define q3
 (inStackOutStack inStack emptyStack))
(define listOfQueues
 (list
  q1
  q2
  q3))
(displayln "Queues: ")
(map displayln listOfQueues)
(displayln "Their inStacks: ")
(map (lambda (q) (displayln (getInStack q))) listOfQueues)
(displayln "Their outStacks: ")
(map (lambda (q) (displayln (getOutStack q))) listOfQueues)
