module QueueStacks where

  type Stack v = [v]

  push :: v -> Stack v -> Stack v
  push value stack = value:stack

  top :: Stack v -> Maybe v
  top []    = Nothing
  top (x:_) = Just x

  pop :: Stack v -> Stack v
  pop []           = []
  pop (_:newStack) = newStack


  data Queue v = InStackOutStack (Stack v) (Stack v) deriving (Eq, Show)

  enqueue :: v -> Queue v -> Queue v
  enqueue value (InStackOutStack inStack outStack) = InStackOutStack (push value inStack) outStack

--   dequeue :: Queue v -> Maybe v
--   dispatch :: Queue v -> Queue v


  -- Tests:
  -- Stacks
  emptyStack :: Stack Int
  emptyStack = []

  stack0 :: Stack Int
  stack0 = push 0 emptyStack

  stack01 :: Stack Int
  stack01 = push 1 stack0

  completeStack :: Stack Int
  completeStack = push 7 . push 6 . push 5 . push 4 . push 3 . push 2 . push 1 . push 0 $ emptyStack

  stack42 :: Stack Int
  stack42 = push 7 . push 6 . push 5 . push 42 . pop . pop . pop . pop $ completeStack

  inStack  = push 7 . push 6 . push 5 . push 4 $ emptyStack
  outStack = push 3 . push 2 . push 1 . push 0 $ emptyStack

  listOfStacks = [emptyStack, stack0, stack01, completeStack, stack42, inStack, outStack]
  topResults = map top listOfStacks

  -- Queues
  q1 :: Queue Int
  q1 = InStackOutStack inStack outStack

  q2 :: Queue Int
  q2 = InStackOutStack emptyStack outStack

  q3 :: Queue Int
  q3 = InStackOutStack inStack emptyStack

  listOfQueues = [q1, q2, q3]
  enqueueResults = map (enqueue 42) listOfQueues
