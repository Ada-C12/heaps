require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n); it touches each element in the list to make the heap and 
# then again to remove the sorted elements and output them as a list O(2n), drop the constant.
# Space Complexity: O(1); I think this is constant, because the heap is created as the array is
# reduced so there is not a growth in memory space (except that a heap may take more space?).
def heapsort(list)
  return list if list.length <= 1
  
  heap = MinHeap.new
  
  until list.empty?
    popped = list.pop
    heap.add(popped)
  end
  
  until heap.empty?
    list << heap.remove
  end
  
  return list
end


