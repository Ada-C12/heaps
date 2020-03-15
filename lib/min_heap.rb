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
  # Time Complexity: o(logn)
  # Space Complexity: o(logn)
  def add(key, value = key)
    # raise NotImplementedError, "Method not implemented yet..."
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: o(logn)
  # Space Complexity: o(1) i think
  def remove()
    # raise NotImplementedError, "Method not implemented yet..."
    swap(0, @store.length - 1)
    result = @store.pop
    heap_down(0) unless @store[0].nil?
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
  # Time complexity: o(1)
  # Space complexity: o(1)
  def empty?
    # raise NotImplementedError, "Method not implemented yet..."
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: o(logn)
  # Space complexity: o(1)
  def heap_up(index)
    parent_index = (index - 1) / 2
    if @store[parent_index].key > @store[index].key && index != 0
      swap(parent_index, index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # raise NotImplementedError, "Method not implemented yet..."
    left_index = (index * 2) + 1
    right_index = (index * 2) + 2

    return if @store[left_index].nil?

    if @store[right_index].nil?
      if @store[index].value > @store[left_index].value
        swap(index, left_index)
      end
      return
    end

    if @store[left_index].key < @store[right_index].key
      swap(left_index, index)
      heap_down(left_index)
    else
      swap(right_index, index)
      heap_down(right_index)
    end
  end
  

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end