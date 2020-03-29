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

# I'm having trouble figuring out why the "can sort a 5-element array" test will not pass for this. I have created a new "can sort a different 5-element array" test and that passes. I am thinking it has to do with the order of numbers - some exact pattern of numbers is causing the heap to not sort properly, but all my tests from the min_heap are passing. Could I get some help?