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
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    
    heap_up(@store.length() - 1)
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def remove()
    swap(0, @store.length - 1)
    element = @store.pop()
    heap_down(0)
    return element.value
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
  # Time complexity: O(logn)
  # Space complexity: O(1)
  def heap_up(index)
    parent_index = (index % 2 == 0) ? (index - 2)/2 : (index -1)/2
    while index > 0 && @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      index = parent_index
      parent_index = (index % 2 == 0) ? (index - 2)/2 : (index -1)/2
    end
  end
  
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_index = index * 2 + 1
    right_index = index * 2 + 2
    size = @store.length

    while (index < size) && (left_index < size || right_index < size)
      left = @store[left_index]
      right = @store[right_index]

      child_index = left_index
      if (left && right) && 
        left.key > right.key
        child_index = right_index
      elsif !left && right
        child_index = right_index
      end

      if @store[index].key > @store[child_index].key
        swap(index, child_index)
        index = child_index
        left_index = index * 2 + 1
        right_index = index * 2 + 2
      else
        break
      end
    end  
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end