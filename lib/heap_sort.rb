require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return list if list.length <= 1
  min_heap = MinHeap.new
  
  list.length.times do
    min_heap.add(list.pop)
  end
  
  until min_heap.empty?
    list << min_heap.remove
  end
  
  return list
  
end