module QueueStacks where

  type Stack v = [v]

  push :: v -> Stack v -> Stack v
  push value stack = value:stack

  top :: Stack v -> Maybe v
  top []    = Nothing
  top (x:_) = Just x

--   pop :: Stack v -> Stack v
--   pop []          = Nothing
--   pop (top:stack) =

--   type Queue v = (Stack v, Stack v)
--
--   enqueue :: Queue v -> v -> Queue v
--
--   dequeue :: Queue v -> Maybe v
--
--   dispatch :: Queue v -> Queue v

  -- Tests
  stack0 :: Stack Int
  stack0 = push 0 []

  stack1 :: Stack Int
  stack1 = push 1 stack0

  completeStack :: Stack Int
  completeStack = push 7 . push 6 . push 5 . push 4 . push 3 . push 2 . push 1 . push 0 $ []

  topResults = map top [stack0, stack1, completeStack]
