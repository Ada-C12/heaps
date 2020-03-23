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
  # Time Complexity: O(log n) where n is number of nodes
  # Space Complexity: O(1)
  def add(key, value)
    @store << HeapNode.new(key, value)
    
    heap_up(@store.length - 1)
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n) where n is number of nodes
  # Space Complexity: O(1)
  def remove()
    # binding.pry
    to_remove = @store[0]
    swap(0, (@store.length - 1))
    @store.pop
    
    heap_down(0)
    
    return to_remove.value
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
  # Time complexity: O(log n) where n is number of nodes
  # Space complexity: O(1)
  def heap_up(index)
    if index != 0
      parent = ((index - 1) / 2)
      if @store[index].key < @store[parent].key
        swap(index, parent)
        heap_up(parent)
      else
        return
      end
    end
    return
  end
  
  # This helper method takes an index and 
  #  moves it down the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = (index * 2 + 1)
    right_child = (index * 2 + 2)
    
    until @store[left_child] == nil || @store[right_child] == nil
      if (@store[index].key > @store[left_child].key) || (@store[index].key > @store[right_child].key)
        if @store[left_child].key < @store[right_child].key
          swap(index, left_child)
          heap_down(left_child)
        else
          swap(index, right_child)
          heap_down(right_child)
        end
      end
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