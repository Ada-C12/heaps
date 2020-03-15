require_relative "heap_node"

class MinHeap
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(key, value = key)
    # add new node to end
    @store << HeapNode.new(key, value)

    # heap-up from added node to reestablish the heap property
    heap_up(@store.length - 1) if @store.length > 1
  end

  
  # This method removes and returns an element from the heap maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    return nil if empty?

    # Swap the last leaf & the root node
    swap(0, -1)

    # Delete the last leaf (last item in the array)
    removed = @store.pop

    # Heap-down the new root, to reestablish the heap property
    heap_down(0) if @store.length > 1
  
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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    return if index.nil? || @store[index].nil?

    parent_index = index/2
    parent_index -= 1 if index.even?

    heap_up_helper(index, parent_index)
  end
  
  def heap_up_helper(index, parent_index)
    return if @store[index].key > @store[parent_index].key

    swap(index, parent_index)
    return if parent_index == 0

    index = parent_index
    parent_index = index/2
    parent_index -= 1 if index.even?

    heap_up_helper(index, parent_index)
  end
  
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if index.nil? || @store[index].nil?
  
    heap_down_helper(index)
  end
   
  def heap_down_helper(index)
    left_child = index * 2 + 1
    right_child = index * 2 + 2

    return if @store[left_child].nil? && @store[right_child].nil?

    if @store[left_child] && @store[left_child].key < @store[index].key
      swap(index, left_child)
      heap_down_helper(left_child)
    end
    
    if @store[right_child] && @store[right_child].key < @store[index].key
      swap(index, right_child)
      heap_down_helper(right_child)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end