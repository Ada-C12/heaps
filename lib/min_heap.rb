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
    parent = (index % 2 == 0) ? index/2 - 1 : index/2
    while index > 0 && @store[index].key < @store[parent].key
      swap(index, parent)
      index = parent
      parent = (index % 2 == 0) ? index/2 - 1 : index/2
    end
  end
  
  # This helper method takes an index and 
  #  moves it down the heap if it's larger
  #  than it's child node.
  def heap_down(current)
    left = 1
    size = @store.length
    while (current < size) && (left < size)
      smaller = left
      right = left + 1
      
      smaller = right if right < size && @store[right].key < @store[left].key

      break if @store[current].key < @store[smaller].key
      swap(current, smaller)
      current = smaller
      left = 2*current + 1
    end
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end