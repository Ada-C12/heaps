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
    node = HeapNode.new(key, value)
    @store << node
    heap_up(@store.length - 1)
  end
  
  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def remove()
    return nil if self.empty?
    swap(0, @store.length - 1)
    removed = @store.pop
    heap_down(0)
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
  # Time complexity: O(log(n))
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0
    if index % 2 == 0
      parent_index = (index - 2) / 2
    else
      parent_index = (index - 1) / 2
    end
    while index != 0 && @store[parent_index].key > @store[index].key
      swap(index, parent_index)
      index = parent_index
      if index % 2 == 0
        parent_index = (index - 2) / 2
      else
        parent_index = (index - 1) / 2
      end
    end
  end
  
  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child_index = 2 * index + 1
    left_child = @store[left_child_index]
    right_child_index = 2 * index + 2
    right_child = @store[right_child_index]
    
    while left_child && right_child
      if @store[index].key > left_child.key && @store[index].key > right_child.key
        if left_child.key < right_child.key
          swap(index, left_child_index)
          index = left_child_index
        else
          swap(index, right_child_index)
          index = right_child_index
        end
      elsif @store[index].key > left_child.key
        swap(index, left_child_index)
        index = left_child_index
      elsif @store[index].key > right_child.key
        swap(index, right_child_index)
        index = right_child_index
      end
      
      left_child_index = 2 * index + 1
      left_child = @store[left_child_index]
      right_child_index = 2 * index + 2
      right_child = @store[right_child_index]
    end
    
    if left_child && left_child.key < @store[index].key
      swap(index, left_child_index)
    end
    
  end
end

# If you want a swap method... you're welcome
def swap(index_1, index_2)
  temp = @store[index_1]
  @store[index_1] = @store[index_2]
  @store[index_2] = temp
end