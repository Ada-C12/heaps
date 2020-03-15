require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  o(logn)
# Space Complexity: o(n)
def heap_sort(list)
  # raise NotImplementedError, "Method not implemented yet..."
  heap = MinHeap.new

  list.each do |v|
    heap.add(v)
  end
  sort_array = []

  index = 0
  while index < list.length
    result = heap.remove
    sort_array << result
    index += 1
  end

  return sort_array
end