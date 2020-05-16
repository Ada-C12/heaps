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
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(key, value = key)
    newNode = HeapNode.new(key, value)
    @store << newNode
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    swap(0, (@store.length - 1))
    removed = @store.pop()
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
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    return index if index == 0

    parent_index = (index - 1)/2

    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    end

    return index
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if index == @store.length - 1

    left_i = index * 2 + 1
    right_i = left_i + 1

    return if left_i > @store.length - 1
    smaller_i = 0
    if right_i > @store.length - 1
      smaller_i = left_i
    else
      @store[left_i].key < @store[right_i].key ? 
        smaller_i = left_i
        :
        smaller_i = right_i
    end

    if @store[index].key > @store[smaller_i].key
      swap(index, smaller_i)
      heap_down(smaller_i)
    end

    return
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end