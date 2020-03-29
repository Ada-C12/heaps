require 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  heap = MinHeap.new 
  
  list.each do |num|
    heap.add(num, num)
  end
  
  counter = 0
  until counter > list.length - 1
    list[counter] = heap.remove
    counter += 1
  end
  
  return list
end