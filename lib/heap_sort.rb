


# This method uses a heap to sort an array.
# Time Complexity:  nlog(n)
# Space Complexity: O(n)
def heap_sort(list)
  heap_sort = MinHeap.new()

  list.each do |number|
    heap_sort.add(number, number)
  end

  sorted = Array.new
  until heap_sort.empty?
    sorted << heap_sort.remove
  end

  return sorted
end 

