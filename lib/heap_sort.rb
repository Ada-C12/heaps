require_relative 'min_heap'
# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return list if list.length <= 1

  heap = MinHeap.new
  list.each do |e|
    heap.add(e)
  end
  
  result = heap.store.map! { |e| e = e.value }

  return result
end
