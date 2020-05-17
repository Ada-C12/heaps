require_relative 'min_heap'
# This method uses a heap to sort an array.
# Time Complexity:  O(log n)
# Space Complexity: O(n)
def heapsort(list)
  return list if list.length <= 1

  heap = MinHeap.new
  list.each do |e|
    heap.add(e)
  end
  
  result = heap.store.map! { |e| e = e.value }

  return result
end
