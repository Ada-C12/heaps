require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n logn)
# Space Complexity: O(n), made a new [] and new MinHeap instance
def heapsort(list)
  heap = MinHeap.new()
  
  # add each element onto MinHeap
  list.each do |element|
    heap.add(element)
  end
  
  # start plucking out the roots from the MinHeap
  sortedList = []
  until heap.empty?
    sortedList << heap.remove()
  end
  
  return sortedList
end






################## O(1) space complexity with sorting in place ##################
### Keeping print statements in there on purpose, makes it easier to understand ###

# see heapsort_inplace.jpg for how the orig list and new MinHeap are sharing the same space
# basically the heap grows in the list space as the unsorted shares drop, and vice versa
def heapsort_inPlace(list)
  puts "\n\nSTARTING WITH list = #{list}"
  
  heap = MinHeap.new()
  list.unshift(heap)
  # now list = [heap, e1, e2, e3, ...] but heap is empty
  # so far space is still O(1) no matter how big the arg list is
  
  
  # list[0] is the heap, and list[1..end] is the unsorted numbers
  # the heap will grow by adding in whatever is at list[1], which will get deleted as they get added to the heap
  # the heap at list[0] will grow while the unsorted numbers will shrink in size until they're gone
  while list[1]
    addThisToHeap = list[1]
    puts "\nadding new node: #{addThisToHeap}"
    heap.add(addThisToHeap)
    puts "\theap at list[0] is now #{heap}"
    
    list.delete_at(1)
    
    puts "\tlist[1] onwards is now #{list[1..-1]}"
  end
  
  # now that list[0] is the heap and list[1] don't exist anymore...
  # start plucking out the roots from the MinHeap, and append it onto the end of list
  puts "\n------ Now start kicking out the root/min from heap and return it to end of list"
  until heap.empty?
    kickOutOfHeap = heap.remove()
    list << kickOutOfHeap
    
    puts "\nKicking out #{kickOutOfHeap}"
    puts "\theap at list[0] is now #{heap}"
    puts "\tlist[1] onwards is now #{list[1..-1]}"
  end
  
  # now get rid of the empty Heap at list[0], and all that's left should be the sorted numbers
  list.shift()
  
  return list
end