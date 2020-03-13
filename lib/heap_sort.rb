require_relative('min_heap')

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  heap = MinHeap.new()
  list.each do |list_item|
    heap.add(list_item)
  end

  new_list = []
  length = list.length
  length.times do |i|
    element = heap.remove()
    new_list << element
  end

  return new_list
end