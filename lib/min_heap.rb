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
    newNode = HeapNode.new(key, value)

    @store << newNode

    length = @store.length

    heap_up(length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    length = @store.length
    swap(0, length - 1)
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
    parent_index = (index - 1 ) / 2

    if @store[parent_index].key > @store[index].key
      swap(parent_index, index)

      while parent_index > 0 
        return heap_up(parent_index)
      end
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)

    # length = @store.length

    left_child_index = (index * 2) + 1
    right_child_index = (index * 2) + 2

    until @store[left_child_index].nil? && @store[right_child_index].nil?
      if @store[left_child_index].nil?
        smallest_child = right_child_index
      elsif @store[right_child_index].nil?
        smallest_child = left_child_index

      elsif @store[left_child_index].key < @store[right_child_index].key
        smallest_child = left_child_index
      else
        smallest_child = right_child_index
      end

      swap(index, smallest_child)
    

      return heap_down(smallest_child)
      
    end

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end