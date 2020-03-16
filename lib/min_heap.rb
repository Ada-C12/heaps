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
    if @store.length == 0
      @store << HeapNode.new(key, value)
      return
    end

    @store << HeapNode.new(key, value)
    # heap_up(@store.length - 1)
    heap_up(@store.length - 1)
    
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    raise NotImplementedError, "Method not implemented yet..."
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
  def heap_up(current_index)
    # the last index is being passed in

    parent_node_index = (current_index + 1)/2 - 1

    while current_index > 0
      if @store[current_index].key < @store[parent_node_index].key
        swap(parent_node_index, current_index)
        current_index = parent_node_index
        parent_node_index = (current_index + 1)/2 - 1
      else  
        return;
      end
    end 
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    raise NotImplementedError, "Method not implemented yet..."
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end

# heap = MinHeap.new
#  heap.add(3, "Pasta")
# print heap.add(2, "Soup")
# heap.add(3, "Pasta")
# heap.add(6, "Soup")
# heap.add(1, "Pizza")
# heap.add(0, "Donuts")
# heap.add(16, "Cookies")
# heap.add(57, "Cake")