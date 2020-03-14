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
  # takes a key & value and constructs a HeapNode to add to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    heap_up(@store.length-1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove
    # Can you delete any other node besides the root?
    return nil if @store.empty?

    swap(0, @store.length - 1)
    target = @store.pop

    heap_down(0)
    return target.value
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

  # This method returns true if the heap is empty; false if not
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(new_index)
    return if new_index == 0
    parent_index = (new_index - 1) / 2

    if @store[new_index].key < @store[parent_index].key
      swap(new_index, parent_index)
      heap_up(parent_index)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_index = index * 2 + 1
    right_index = index * 2 + 2

    if right_index < @store.length
      min_child = @store[left_index].key < @store[right_index].key ? left_index : right_index
      if @store[index].key > @store[min_child].key
        swap(index, min_child)
        heap_down(min_child)
      end
    elsif left_index < @store.length
      if @store[index].key > @store[left_index].key
        swap(index, left_index)
      end
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end