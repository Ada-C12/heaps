

# This method uses a heap to sort an array.
# Time Complexity: O(nlogn + nlogn) The heapsort will iterate n times through the list to add elements to the heap, taking logn times at worst each time and then the heapsort will iterate n times through the heap to remove elements, taking logn times at worst to remove elements. This reduces to O(nlogn)
# Space Complexity: O(n) the heapsort function creates a heap of n size when sorting.
def heapsort(list)
  heap = MinHeap.new
  sorted_list = []

  list.each do |item|
    heap.add(item)
  end

  list.length.times do 
    sorted_list << heap.remove()
  end

  return sorted_list
end