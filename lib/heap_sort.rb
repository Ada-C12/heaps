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








#################################### STILL A MESS... ####################################
################## Attempting O(1) space complexity... ##################


# I THINK I'll need a new class for MinHeap ???
class MinHeapInPlace
  
  def initialize (store = [])
    @store = store
    approvedMemberCount = 0
    startIndex = nil
    endIndex = nil
  end
  
  def add(key, value = key, startIndex = 0, endIndex = approvedMemberCount)
    newNode = HeapNode.new(key, value)
    @store << newNode
    
    # compare up from this newNode
    heap_up(endIndex)
  end
  
  def remove()
    swap(0, @store.length - 1)
    removed = @store.pop()
    
    heap_down(0) unless @store.empty?
    
    return removed.value
  end
  
  
  # Used for Testing
  def to_s
    return "[]" if @store.empty?
    
    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end
    
    output += @store.last.value + "]"
    
    return output
  end
  
  def empty?
    return @store.length == 0
  end
  
  private
  
  def heap_up(index)
    if index == 0
      # no more upstream to compare to
      return
      
    else
      # Compare node @ index to its parent
      # if child >= parent, min heap :-)  base case
      # if child < parent, swap places, then heap_up(parentIndex), recursion!
      parentIndex = ((index - 2).to_f / 2).ceil
      
      if @store[index].key >= @store[parentIndex].key
        return 
      else
        swap(index, parentIndex)
        heap_up(parentIndex)
        return
      end
    end
  end
  
  def heap_down(parentIndex)
    # compare node @ parentIndex to its children
    # if parent <= both children, min heap :-)  base case
    # if parent > either/both child, swap places with the smaller child, then min_heap_down(childIndex), recursion!
    # when no more children to compare to, base case :-)
    
    # first find out if parent has LC or RC
    indexLC = parentIndex * 2 + 1 
    indexRC = indexLC + 1
    
    if @store.length > indexRC
      # both LC & RC exist, need to compare with both children
      if (@store[parentIndex].key > @store[indexLC].key) && (@store[parentIndex].key > @store[indexRC].key)
        # both LC & RC broke the heap property, which one is smaller?
        @store[indexLC].key > @store[indexRC].key ? (indexOfSmallerChild = indexRC) : (indexOfSmallerChild = indexLC)
        swap(parentIndex, indexOfSmallerChild)
        heap_down(indexOfSmallerChild)
        
      elsif @store[parentIndex].key > @store[indexLC].key
        # only LC broke the heap property
        swap(parentIndex, indexLC)
        heap_down(indexLC)
        
      elsif @store[parentIndex].key > @store[indexRC].key
        # only RC broke the heap property
        swap(parentIndex, indexRC)
        heap_down(indexRC)
        
      else 
        # both children are bigger than parent -> min heap :-) base case
        return
      end
      
    elsif @store.length > indexLC
      # only LC exists
      if @store[parentIndex].key <= @store[indexLC].key
        # min heap :-) base case
        return 
      else
        swap(parentIndex, indexLC)
        heap_down(indexLC)
      end
      
    else
      # no children, base case
      return
    end
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end





# see heapsort_inplace.jpg for how the orig list and new MinHeap are sharing the same space
# basically the heap grows in the list space as the unsorted shares drop, and vice versa
def heapsort_in_place2(list)
  heap = MinHeap.new(list)
  list.unshift(heap)
  # now list = [heap, e1, e2, e3, ...] but heap is empty
  
  # add each element onto MinHeap
  
  # start plucking out the roots from the MinHeap
end