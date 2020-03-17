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
  # Space Complexity: O(1)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    swap(0, @store.length - 1)
    remove_node = @store.pop
    heap_down(0)
    return remove_node.value
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
  #  moves it up the heap, if it is less than its parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    while index > 0 && @store[(index - 1) / 2].key > @store[index].key
      swap(((index - 1) / 2), index)
      index = (index - 1) / 2
    end
  end
  
  # This helper method takes an index and moves it down the heap if it's smaller than its child node.
  def heap_down(index)
    while !is_leaf(index)
      if @store[index].key > @store[left_child(index)].key || @store[index].key > @store[right_child(index)].key
        if @store[left_child(index)].key < @store[right_child(index)].key
          swap(index, left_child(index))
          index = left_child(index)
        else
          swap(index, right_child(index))
          index = right_child(index)
        end 
      end 
    end
  end 
  
  def is_leaf(index)
    return index >= ((@store.length - 1) / 2) && index < @store.length
  end 
  
  def left_child(index)
    return index * 2 + 1
  end 
  
  def right_child(index)
    return index * 2 + 2
  end 
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end