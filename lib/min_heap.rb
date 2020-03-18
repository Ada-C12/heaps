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
    return heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(1) because we are doing a swap and deleting at the end
  # (would be O of n if we were deleting from the front)
  # Space Complexity: O(1) because we're not creating any new spaces in memory

  def remove

    if @store.empty?
      raise ArgumentError, 'There are no nodes to remove'
    end

    # keep track of the element we're removing so we can return it
    removed = @store[0].value

    # swap root and last node in heap ... 
    @store[0], @store[@store.length - 1] = @store[@store.length - 1], @store[0]

    # ... then delete last node (this is more efficient than removing first node)
    @store.delete_at(@store.length - 1)

    # we're done if there's only one node left after deletion
    return removed if @store.length == 1

    # if there's more than one node left, call the recursive heap down method to 
    # re-order the remaining nodes, starting at the top
    heap_down(0)
    return removed

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
  # Time complexity: O(1) -- I *think* this code will stop running once count gets
  # higher than 0 but I'm not certain
  # Space complexity: O(1)
  def empty?
    @store.length == 0 ? true : false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) because we're swapping max once per tree level
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
  #  moves it down the heap if it's larger
  #  than its child nodes.
  def heap_down(index)

    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2

    # BASE CASES
    # stop if we're at the last leaf in the tree 
    return if @store[left_child_index].nil? && @store[right_child_index].nil?
    # stop if both children are greater than or equal to parent
    return if @store[left_child_index].key >= @store[index].key && @store

    # RECURSIVE CASES
    # if parent is greater than left child, swap and look at next level --
    # need @store[index] conditional to stop code running after we've reached 
    # the bottom of the heap
    if @store[index] && @store[index].key > @store[left_child_index].key
      @store[index], @store[left_child_index] = @store[left_child_index], @store[index] 
      puts "After swap, the parent node is #{@store[index].key}:#{@store[index].value} and the left child node is #{@store[left_child_index].key}:#{@store[left_child_index].value}"
      heap_down(left_child_index)
    end

    # if parent is greater than right child, swap and look at next level
    if @store[index] && @store[index].key > @store[right_child_index].key
      @store[index], @store[right_child_index] = @store[right_child_index], @store[index] 
      heap_down(right_child_index)
    end

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end