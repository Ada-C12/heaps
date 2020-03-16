require_relative "./min_heap"


# This method uses a heap to sort an array.
# Time Complexity:  n(log(n))
# Space Complexity: O(1)
def heapsort(list)
  heap = MinHeap.new

  until list.empty?
    heap.add(list.pop)
  end

  index = 0
  until heap.empty?
    list[index] = heap.remove()
    index += 1
  end
  return list
end