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
  # Time Complexity: usually O(1) because unlike adding to the front, appending /
  # adding to the end doesn't require reordering the whole array
  # Space Complexity: O(1)
  def add(key, value = key)
    # add the new node to the end of the array
    @store << HeapNode.new(key, value)
    # call recursive heap up method with the index of the node we just added 
    index = @store.length - 1
    return heap_up(index)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    raise NotImplementedError, "Method not implemented yet..."
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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    @store.length == 0 ? true : false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) because the code runs once per tree level
  # Space complexity: O(log n)
  def heap_up(index)

    # formula for determining parent index of a given element's index -- 
    # parentheses are crucial!
    parent_index = (index - 1) / 2
    
    # BASE CASES
    # stop if the element we're looking at is at the root of the tree
    return if index == 0
    # since this is a min heap, we're done if the parent's key is less than (or  
    # equal to) the key of the element we're looking at
    return if @store[parent_index].key <= @store[index].key

    # RECURSIVE CASE: swap element with parent ...
    @store[parent_index], @store[index] = @store[index], @store[parent_index]
    # ... and make parent the new element we're heaping up
    return heap_up(parent_index)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    raise NotImplementedError, "Method not implemented yet..."
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end