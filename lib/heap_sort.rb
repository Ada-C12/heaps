

# This method uses a heap to sort an array.
# Time Complexity:  O(1)
# Space Complexity: O(n)
def heapsort(array)
  heap = MinHeap.new
  
  array.each do |element|
    heap.add(element, element)
  end
  
  result = []
  until heap.empty?
    result << heap.remove
  end
  
  return result
end