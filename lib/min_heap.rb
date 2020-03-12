class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    newNode = HeapNode.new(key, value)
    @store << newNode

    # compare up from this newNode
    heap_up(@store.length-1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
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

  # This method returns true if the heap is empty
  # Time complexity: O(n)
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    if index == 0
      # no more upstream to compare to
      return
    
    else
      # Compare node @ index to its parent
      # if child >= parent, min heap :-)  base case
      # if child < parent, swap places, then heap_up(parentIndex), recursion!

      # this gets the correct ParentIndex for either L or R childIndex
        # ex: for parent @ index 1, its LC should be at index 3 and RC at index 4
          # calculating the parentIndex for index 3... we get (0.5).ceil = 1
          # and calculating the parentIndex for index 4... we get 1.ceil = 1
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

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return


      # compare node @ parentIndex to its children
    # # if parent <= both children, min heap :-)  base case
    # # if parent > either/both child, swap places with the smallest child, then min_heap_down(childIndex), recursion!
    # # base case is if no more children to compare to
    
    # maybeLChildIndex = parentIndex * 2 + 1
    # if @store.length > maybeLChildIndex
    #   # yes there's at least LC to compare to
      
    #   # look for LC & RC, do either exist?
    #   LC_index = maybeLChildIndex
    #   RC_index = nil
    #   if @store.length > maybeLChildIndex + 1
    #     # RC exists
    #     RC_index = LC_index + 1  
    #   end
      
    #   if !RC_index 
    #     # only left child exists
    #     if @store[parentIndex] <= @store[LC_index]
    #       # min heap :-) base case
    #       return 
    #     else
    #       swap(parentIndex, LC_index)
    #       min_heap_down(LC_index)
    #     end
        
    #   else
    #     # need to compare both children
    #     if (@store[parentIndex] > @store[LC_index]) && (@store[parentIndex] > @store[RC_index])
    #       # which of the children is smaller?
    #       @store[LC_index] > @store[RC_index] ? (indexOfSmallerChild = RC_index) : (indexOfSmallerChild = LC_index)
    #       swap(parentIndex, indexOfSmallerChild)
    #       min_heap_down(indexOfSmallerChild)
    #       return
    #     elsif @store[parentIndex] > @store[LC_index]
    #       # only LC broke the heap property
    #       swap(parentIndex, LC_index)
    #       min_heap_down(LC_index)
    #       return
    #     elsif @store[parentIndex] > @store[RC_index]
    #       # only RC broke the heap property
    #       swap(parentIndex, RC_index)
    #       min_heap_down(RC_index)
    #       return
    #     else 
    #       # both children are bigger than parent -> min heap :-) base case
    #       return
    #     end
    #   end
      
    # else
    #   # base case, no more children left to compare to
    #   return
    # end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end