require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n(log(n))) where n is the number of items in the array
# Space Complexity: O(1) because as I add to the heap, I take it out of the list, and I store the result in original list
def heapsort(list)
  new_heap = MinHeap.new()
  
  until list.empty?
    new_heap.add(list.pop)
  end
  
  storage_index = 0
  until new_heap.empty?
    list[storage_index] = new_heap.remove
    storage_index += 1
  end
  
  return list
end
