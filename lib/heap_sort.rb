require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity: On(log n)
# Space Complexity: O(1)
def heap_sort(list)
  size = list.length
  heap = MinHeap.new
  
  i=0
  while i < size
    heap.add(list[i])
    i+=1
  end
  
  i=0
  while i < size
    result = heap.remove
    list[i] = result
    i+=1
  end 
  
  return list
end
