require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  heap = MinHeap.new()
  list.each do |element|
    heap.add(element)
  end

  output = []
  while !heap.empty?
    output << heap.remove()
  end
  return output
end