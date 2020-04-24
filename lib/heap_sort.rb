require 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heap_sort(list)
  heap = MinHeap.new 
  
  list.each do |num| # T: O(n)
    heap.add(num, num) # S: O(n)
  end
  
  counter = 0
  until counter > list.length - 1
    list[counter] = heap.remove # T: O(log n)
    counter += 1
  end
  
  return list
end