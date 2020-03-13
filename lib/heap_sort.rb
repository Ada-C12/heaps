require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity: O(n * log n)
# Space Complexity: O(1)
def heapsort(list)
  new_heap = MinHeap.new
  return list if list.nil? || list.length == 1

  until list.empty?
    new_heap.add(list.pop)
  end

  index = 0
  until new_heap.empty?
    list[index] = new_heap.remove()
    index += 1
  end

  
  return list
  

end