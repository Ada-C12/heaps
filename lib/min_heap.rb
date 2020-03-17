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
  # Time Complexity: I think O(log N)
  # Space Complexity: O(1) - I think this is for all space regardless of operation because it's not necessarily
  #growing all that much in size?
  def add(key, value = key)
    @store << HeapNode.new(key,value)
    if @store.length > 1
      heap_up(@store.length - 1)
    end
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log N) - deleting the top element
  # Space Complexity: O(1)
  def remove()
    if @store.empty?
      return nil
    end
    
    swap(0, @store.length - 1)
    result = @store.pop
    
    heap_down(0) unless @store.empty?
    return result.value
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
    return true if @store.empty? 
  end
  
  private
  
  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    if index.even?
      parent_index = (index - 2)/2 
    elsif index.odd?
      parent_index = (index - 1)/2 
    end 
    
    if @store[index].key < @store[parent_index].key
      swap(parent_index, index)
      heap_up(parent_index) if parent_index != 0 
    end 
  end
  
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if self.empty?
    left_child = 2 * index + 1 
    right_child = 2 * index + 2
    
    if @store[left_child] == nil 
      return 
    elsif @store[right_child] == nil || @store[left_child].key < @store[right_child].key
      smallest_child = left_child 
    elsif @store[left_child].key > @store[right_child].key
      smallest_child = right_child 
    end 
    
    if @store[index].key > @store[smallest_child].key
      swap(smallest_child, index)
      heap_down(smallest_child) 
    end 
    
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end