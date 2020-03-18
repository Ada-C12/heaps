

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  heap = MinHeap.new
  sorted_list = []

  list.each do |item|
    heap.add(item)
  end

  list.length.times do 
    sorted_list << heap.remove()
  end

  return sorted_list
end