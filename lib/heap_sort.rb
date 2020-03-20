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






################## ATTEMPTING O(1) space complexity with sorting in place ##################

# see heapsort_inplace.jpg for how the orig list and new MinHeap are sharing the same space
# basically the heap grows in the list space as the unsorted shares drop, and vice versa
# uhhhhh... apparently this is still O(n) space b/c I'm still allocating memory for a size-n heap, per Jesse...
# Time O(n^2 * log n) per Chris
def heapsort_NOT_REALLY_inPlace(list)
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

  
######################################################################################
####################### see Tiffany's code below, bc I gave up #######################
######################################################################################
# This method uses a heap to sort an array.
# Time Complexity: O(nlogn)??
# Space Complexity: O(1)
def heapsort_inPlace(list)
  return list if list.length <= 1

  puts "\nSTARTING with #{list}"

  # build a max heap
  list.length.times do |i|
    heap_up(list, i)
    puts "\tlist = #{list}"
  end

  puts "\nREADY to pluck out Max and put start populating from end of list"
  last = list.length - 1

  # pop off the top of the heap
  # place it in the last unsorted slot
  # re-heap the unsorted list
  list.length.times do |i|
    swap(list, 0, last)
    puts "\tpost swap,\tlist = #{list}"
    heap_down(list, 0, last)
    puts "\t\t\t adj = #{list}"

    last -= 1
  end

  return list
end

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end

def heap_up(list, index)
  # max-heapify
  
  return if index == 0    # has no parents to compare to

  puts "\tindex #{index}, adjusting for max heap property prn..."
  parent_index = (index - 1)/2

  if list[index] > list[parent_index]
    swap(list, index, parent_index)      
    heap_up(list, parent_index)
  end

  return
end

def heap_down(list, index, last)
  return if index == last - 1

  index_1 = 2 * index + 1
  index_2 = 2 * index + 2
  return if index_1 > last - 1

  larger_child_index = find_larger_child_index(list, index_1, index_2, last)

  if list[index] < list[larger_child_index]
    swap(list, index, larger_child_index)
    heap_down(list, larger_child_index, last)
  end

  return
end

def find_smaller_child_index(index_1, index_2) 
  return index_1 if index_2 > @store.length - 1

  if @store[index_1].key <= @store[index_2].key
    return index_1
  end

  return index_2
end

def find_larger_child_index(list, index_1, index_2, last)
  return index_1 if index_2 > last - 1

  if list[index_1] >= list[index_2]
    return index_1
  end

  return index_2
end