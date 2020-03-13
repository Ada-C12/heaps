require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  heap = MinHeap.new()
  list.each do |num|
    heap.add(num)
  end
  res = []
  list.length.times do 
    res << heap.remove()
  end
  return res
end