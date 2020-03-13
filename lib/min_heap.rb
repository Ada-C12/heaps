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
  # Time Complexity: O(log(n)) where n is the size of the tree
  # Space Complexity: O(log(n)) where n is the size of the tree
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    last_index = @store.length - 1
    return heap_up(last_index)
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log(n)) where n is the size of the heap
  # Space Complexity: O(log(n)) where n is the size of the heap
  def remove()
    last_index = @store.length - 1
    swap(0, last_index)
    
    removed_node = @store.pop()
    heap_down(0)
    
    return removed_node.value
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
    return true if @store[0].nil?
    return false
  end
  
  private
  
  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log(n)) where n is the size of the heap
  # Space complexity: O(log(n)) where n is the size of the heap because it's making a recursive stack
  def heap_up(index)
    parent_index = (index - 1) / 2
    
    # if it's at index 0, stop (it's already the root)
    return if index == 0 || @store[index].key > @store[parent_index].key
    
    # if parent node's key is greater than the addition key, swap them
    # if @store[parent_index].key > @store[index].key
    swap(index, parent_index)
    return heap_up(parent_index)
  end
  
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child_index = (index * 2) + 1
    right_child_index = (index * 2) + 2
    
    return if @store[left_child_index].nil? && @store[right_child_index].nil?
    return if @store[left_child_index].key > @store[index].key && @store[right_child_index].key > @store[index].key
    
    if @store[left_child_index].key < @store[right_child_index].key
      swap(index, left_child_index)
      return heap_down(left_child_index)
    else
      swap(index, right_child_index)
      return heap_down(right_child_index)
    end
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end