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