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
    temp_root = @store[0]
    swap(0, @store.length - 1)
    @store.delete_at(@store.length - 1)

    heap_down() unless @store.empty?

    return temp_root.value
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
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(current_index)
    parent_index = (current_index - 1)/2

    if !exists?(parent_index) || @store[current_index].key > @store[parent_index].key
      return
    else
      swap(current_index, parent_index)

      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's larger
  #  than it's children nodes.
  def heap_down(current_index = 0)
    l_child_index = (current_index * 2) + 1
    r_child_index = (current_index * 2) + 2

    if !exists?(l_child_index) && !exists?(r_child_index)
      return
    elsif @store[l_child_index].key < @store[r_child_index].key
      swap(current_index, l_child_index)
      heap_down(l_child_index)
    elsif @store[l_child_index].key > @store[r_child_index].key
      swap(current_index, r_child_index)
      heap_down(r_child_index)
    end
  end

  def exists?(index)
    return index > -1 && index < @store.length
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end