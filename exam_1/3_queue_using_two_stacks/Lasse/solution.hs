module QueueStacks where

type Stack v = [v]

push :: v -> Stack v -> Stack v
push = (:)

top :: Stack v -> Maybe v
top [] = Nothing
top (x:ls) = Just x

pop :: Stack v -> Stack v
pop = tail

data Queue v = InStackOutStack (Stack v) (Stack v) deriving (Eq, Show)

enqueue :: v -> Queue v -> Queue v
enqueue v (InStackOutStack ls1 ls2) = (InStackOutStack (v:ls1) ls2)

dequeue :: Queue v -> Queue v
dequeue (InStackOutStack [] []) = InStackOutStack [] []
dequeue (InStackOutStack ls1 (x:ls2)) = InStackOutStack ls1 ls2
dequeue q = dequeue . dispatch $ q

dispatch :: Queue v -> Queue v
dispatch (InStackOutStack ls1 ls2) = InStackOutStack [] (ls2 ++ reverse ls1)
