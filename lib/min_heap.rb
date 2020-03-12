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
  # Time Complexity: O(log n), from heap_up()
  # Space Complexity: O(1)
  def add(key, value = key)
    newNode = HeapNode.new(key, value)
    @store << newNode

    # compare up from this newNode
    heap_up(@store.length-1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n), from heap_down()
  # Space Complexity: O(1)
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
  # Time complexity: O(log n)
  # Space complexity: O(1)
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