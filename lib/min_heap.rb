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
    
    if @store.length > 1
      heap_up(@store.length - 1)
    end
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: ?
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
  # Time complexity: O(1) - arrays keep track of their length so that this can be contant time retrieval.
  # Space complexity: O(1)
  def empty?
    @store.empty?
  end
  
  private
  
  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index) 
    return if index == 0
    if index % 2 == 0
      parent_index = (index / 2) - 1  
    else
      parent_index = (index / 2)
    end
    
    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    end
  end
  
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # ===> Aren't we taking the new root and comparing it to its child and moving it DOWN?
  def heap_down(index)
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2
    return if @store[left_child].nil?
    
    smaller_child = left_child
    if @store[right_child] && (@store[right_child].key < @store[smaller_child].key)
      smaller_child = right_child
    end
    
    if @store[index].key > @store[smaller_child].key
      swap(index, smaller_child)
      heap_down(smaller_child)
    end
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
