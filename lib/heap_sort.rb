
# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn)
# Space Complexity: O(n)
def heapsort(list)
  heap = MinHeap.new

  i = 0
  while i < list.length
    heap.add(list[i])
    i += 1
  end

  sort_array = []
  until heap.empty?
    sort_array << heap.remove
  end

  return sort_array

end