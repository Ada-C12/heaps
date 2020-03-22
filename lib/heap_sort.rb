
require_relative 'min_heap'
# This method uses a heap to sort an array.
# Time Complexity: O (n log (n))
# Space Complexity: O(n)
def heap_sort(list)
  return [] if list.nil?
  return list if list.length == 1
  
  heap = MinHeap.new 
  
  list.each do |node|
    heap.add(node)
  end
  
  sorted_heap = []
  
  list.length.times do 
    node = heap.remove 
    sorted_heap << node
  end
  return sorted_heap
end