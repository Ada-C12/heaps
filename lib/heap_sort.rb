require_relative('min_heap')

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n) where n is the number of items in the list
# Space Complexity: O(log n)
def heapsort(list)
  heap = MinHeap.new()
  list.each do |list_item| # O(n)
    heap.add(list_item) # O(log n)
  end

  new_list = []
  length = list.length # O(n)
  length.times do |i| # O(n)
    element = heap.remove() # O(log n)
    new_list << element # O(1) or worse case O(n)
  end

  return new_list
end