require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  o(n log(n))
# Space Complexity: o(n)
def heapsort(list)
  # raise NotImplementedError, "Method not implemented yet..."
  heap = MinHeap.new
  return list if list.nil? || list.length == 1

  until list.empty?
    heap.add(list.pop)
  end
  sorted_list = []
  list.length.times do 
    sorted_list << heap.remove
  end
  return sorted_list
end