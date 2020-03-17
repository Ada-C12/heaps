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
  # Time Complexity: O(nlogn)
  # Space Complexity: O(n)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    heap_up(@store.length-1)
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(nlogn)
  # Space Complexity: O(1)
  def remove()
    if @store.empty?
      return nil
    end
    swap(0, @store.length-1)
    min = @store.pop
    heap_down(0) unless @store.empty?
    return min.value
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
    if @store == []
      return true
    else
      return false
    end
  end
  
  private
  
  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(nlogn)
  # Space complexity: O(1)
  def heap_up(index)
    # for right children
    if index % 2 == 0
      parent = (index - 2) / 2
      unless parent < 0
        if @store[index].key < @store[parent].key
          swap(index, parent)
          heap_up(parent)
        end
      end
    end
    # for left children
    if index % 2 == 1
      parent = (index - 1) / 2
      unless parent < 0
        if @store[index].key < @store[parent].key
          swap(index, parent)
          heap_up(parent)
        end
      end
    end
  end
  
  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    if !@store[index+1].nil? && @store[index].key > @store[index+1].key
      swap(index, index+1)
      heap_down(index+1)
    elsif !@store[index+2].nil? && @store[index].key > @store[index+2].key
      swap(index, index+2)
      heap_down(index+2)
    end
  end
  
  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end