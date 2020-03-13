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
  # Time Complexity: O(logn)
  # Space Complexity: O(1) if you're adding one new node
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node

    heap_up(@store.length - 1)
    return
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def remove()
    swap(0, @store.length - 1)
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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(1)
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0

    parent_index = (index - 1)/2

    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)      
      heap_up(parent_index)
    end

    return
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if index == @store.length - 1

    index_1 = 2 * index + 1
    index_2 = 2 * index + 2
    return if index_1 > @store.length - 1

    smaller_child_index = find_smaller_child_index(index_1, index_2)
    
    if @store[index].key > @store[smaller_child_index].key
      swap(index, smaller_child_index)
      heap_down(smaller_child_index)
    end

    return
  end

  def find_smaller_child_index(index_1, index_2) 
    return index_1 if index_2 > @store.length - 1

    if @store[index_1].key <= @store[index_2].key
      return index_1
    end

    return index_2
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end