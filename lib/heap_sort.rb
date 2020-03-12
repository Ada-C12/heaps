require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n logn)
# Space Complexity: O(n), made a new [] and new MinHeap instance
def heapsort(list)
  heap = MinHeap.new()
  
  # add each element onto MinHeap
  list.each do |element|
    heap.add(element)
  end
  
  # start plucking out the roots from the MinHeap
  sortedList = []
  until heap.empty?
    sortedList << heap.remove()
  end
  
  return sortedList
end


### Attempting O(1) space complexity...
# I think I'll need a new class for MinHeap...


# see heapsort_inplace.jpg for how the orig list and new MinHeap are sharing the same space
# basically the heap grows in the list space as the unsorted shares drop, and vice versa
def heapsort_in_place(list)
  heap = MinHeap.new()
  listLength = list.length

  # add each element onto MinHeap
  currIndex = 0
  while currIndex < listLength
    heap.add(list[currIndex])
  end
  
  # start plucking out the roots from the MinHeap
end