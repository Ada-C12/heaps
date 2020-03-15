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
  # Time Complexity: o(log n)
  # Space Complexity: o(log n)
  def add(key, value = key)
    # raise NotImplementedError, "Method not implemented yet..."
    node = HeapNode.new(key, value)
    @store << node
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: o(log n)
  # Space Complexity: o(log n)
  def remove()
    # raise NotImplementedError, "Method not implemented yet..."
    if @store.empty?
      return nil
    end

    swap(0, @store.length - 1)
    removed_node = @store.pop
    heap_down(0) unless @store.empty?
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
  # Time complexity: o(log n)
  # Space complexity: o(log n)
  def heap_up(index)
    return if index == 0 
    parent = (index - 1) / 2
    
    if @store[parent].key > @store[index].key
      swap(parent, index)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # raise NotImplementedError, "Method not implemented yet..."
    
  end



  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end