# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  new_heap = MinHeap.new

  list.each do |num|
    new_heap.add(num, num)
  end

  ordered_list = Array.new
  until new_heap.empty?
    ordered_list << new_heap.remove
  end

  return ordered_list
end