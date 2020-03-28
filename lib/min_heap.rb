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
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    index = @store.length - 1
    heap_up(index) #index of new node
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    # swap the node at index 0 with the left bottom node. then remove the last node
    swap(0, @store.length - 1)
    return_value = @store.pop.value

    # reorder the nodes by looking at its children
    heap_down(0)

    return return_value
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
    return true if @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) only comparing with its parent on one side of the tree
  # Space complexity: O(log n) stack trace of heap_up and swap
  def heap_up(index)
    return if index == 0

    # compares with its parent element - if smaller, swap
    parent_index = (index - 1) / 2

    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # given the index of parent node, compare its R child and L child
    left_child = 2 * index + 1
    right_child = 2 * index + 2

    # continue to heap down UNTIL the parent is smaller or == its children
    return if @store[index].key <= @store[left_child].key && @store[index].key <= @store[right_child].key
      if @store[left_child].key < @store[right_child].key     # swap the lesser child with its parent
        swap(index, left_child)
        heap_down(left_child)    
      else
        swap(index, right_child)
        heap_down(right_child)
      end
    
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end