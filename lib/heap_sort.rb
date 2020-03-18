# This method uses a heap to sort an array.
# Time Complexity: n log n -- n to put elements in heap, log n to sort, 
# and n log n put them back in the array
# Space Complexity: O(n)
def heapsort(list)
  return [] if list.length == 0
  return list if list.length == 1

  heap = MinHeap.new
  sorted_list = []

  # put each list element in a min heap
  # O of n operation where n is the number of elements in the list
  list.each do |element|
    # log n operation
    heap.add(element)
  end

  # remove elements from the min heap (will always remove lowest-value key)
  # and put them into the sorted list
  list.length.times do
    # log n operation
    sorted_list << heap.remove
  end

  return sorted_list
end