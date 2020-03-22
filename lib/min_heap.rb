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
  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def add(key, value = key)
    newNode = HeapNode.new(key, value)
    @store << newNode
    
    heap_up(@store.length - 1)
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def remove()
    return nil if @store.empty?
    
    length = @store.length 
    swap(0, length -1)
    
    removed_node = @store.pop
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
    if @store.length == 0
      return true
    else 
      return false
    end
  end
  
  private
  
  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log (n))
  # Space complexity: O(1)
  def heap_up(index)
    parent = (index - 1) / 2
    
    if @store[parent].key > @store[index].key
      swap(parent, index)
    end    
    
    while parent > 0 
      return heap_up(parent)
    end
  end
  
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2
    
    return if @store[left_child].nil? && @store[right_child].nil?
    
    if @store[left_child].nil?
      smallest_child = right_child
    elsif @store[right_child].nil?
      smallest_child = left_child
    elsif @store[left_child].key < @store[right_child].key 
      smallest_child = left_child
    else  
      smallest_child = right_child
    end
    
    if @store[index].key > @store[smallest_child].key 
      swap(index, smallest_child)
    end
    
    return heap_down(smallest_child)
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end