require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def heap_sort(list)
  heap = MinHeap.new

  list.each do |item|
    heap.add(item)
  end

  sorted_array = []

  length = list.length
  
  length.times do
    item = heap.remove
    sorted_array << item
  end

  return sorted_array
end
