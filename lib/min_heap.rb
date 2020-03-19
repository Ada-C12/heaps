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
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    # raise NotImplementedError, "Method not implemented yet..."
    return nil if @store.nil?
    swap(0,@store.length - 1)
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
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    return if index == 0
    parent_index = (index % 2 != 0) ? (index / 2) : (index / 2 - 1)
    if @store[index].key < @store[parent_index].key
      swap(index,parent_index)
      heap_up(parent_index)
    else
      return
    end
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's bigger
  #  than its child node.
  def heap_down(index)
    return if index == nil
    left_child_index = (((index * 2) + 1) < (@store.length - 1)) ? ((index * 2) + 1) : nil
    right_child_index = (((index * 2) + 2) < (@store.length - 1)) ? ((index * 2) + 2) : nil

    if !left_child_index && !right_child_index
      return
    elsif left_child_index && !right_child_index
      if @store[index].key > @store[left_child_index].key
        swap(index,left_child_index)
      end
    elsif !left_child_index && right_child_index
      if @store[index].key > @store[right_child_index].key
        swap(index,right_child_index)
      end
    else
      if @store[left_child_index].key < @store[right_child_index].key
        index_with_smaller_key = left_child_index
      else
        index_with_smaller_key = right_child_index
      end
      swap(index, index_with_smaller_key)
    end
    heap_down(index_with_smaller_key)  
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end