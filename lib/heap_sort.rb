require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n)
# Space Complexity: O(n)
def heapsort(list)
  heap = MinHeap.new()

  list.each do |element|
    heap.add(element)
  end

  result = []
  while !heap.empty?
    node = heap.remove
    result.push(node)
  end

  return result
end