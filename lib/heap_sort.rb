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








#################################### STILL A MESS... ####################################
################## Attempting O(1) space complexity... ##################

# see heapsort_inplace.jpg for how the orig list and new MinHeap are sharing the same space
# basically the heap grows in the list space as the unsorted shares drop, and vice versa
def heapsort_in_place(list)
  heap = MinHeap.new(list)
  list.unshift(heap)
  # now list = [heap, e1, e2, e3, ...] but heap is empty

  lastIndexOfHeap = 0
  startIndexOfUnsorted = 1
  
  
  # add each element onto MinHeap
  
  # start plucking out the roots from the MinHeap
end