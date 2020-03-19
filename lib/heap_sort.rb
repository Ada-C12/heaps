require_relative './min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn)
# Space Complexity: O(n)
def heap_sort(list)
  size = list.length
  return list if size == 0 || size == 1
  
  heap = MinHeap.new
  i = 0
  
  while i < size
    heap.add(list[i])
    i += 1
  end
  
  i = 0
  while i < size
    result = heap.remove
    list[i] = result
    i += 1
  end
  return list
end