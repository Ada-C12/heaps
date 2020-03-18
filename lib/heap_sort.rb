require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  new_heap = MinHeap.new

  new_array = []

  list.each do |element|
    new_heap.add(element)
  end

  until new_heap.empty?
    new_array << new_heap.remove()
  end

  return new_array
end