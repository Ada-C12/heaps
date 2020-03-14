require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  my_heap = MinHeap.new

  list.each do |element|
    my_heap.add(element, element)
  end

  result = []
  until my_heap.empty?
    result << my_heap.remove
  end
  
  return result
end