

# This method uses a heap to sort an array.
# Time Complexity:  I think this is O(n)? It touches every item in the list
# Space Complexity: O(n)? - creating new sorted array
def heap_sort(list)
  return list if list == []
  
  heap = MinHeap.new()
  new_array = []
  
  until list.empty?
    removed = list.pop
    heap.add(removed)
  end
  
  until heap.empty?
    new_addition = heap.remove
    new_array << new_addition
  end
  
  return new_array
end