class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  attr_reader :store
  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    return heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    swap(0, -1)
    temp = @store[-1]
    @store.pop
    heap_down(0)

    return temp.value
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
    return @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    parent = (index - 1) / 2
    return if index == 0 || @store[index].key > @store[parent].key
    
    swap(index, parent)

    return heap_up(parent)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = (2 * index) + 1
    right_child = (2 * index) + 2

    return if @store[left_child] == nil && @store[right_child] == nil

    if @store[right_child] == nil && @store[left_child].key < @store[index].key
      return swap(index, left_child)
    elsif @store[right_child] == nil && @store[left_child].key > @store[index].key
      return
    end
    
    return if @store[left_child].key > @store[index].key && @store[right_child].key > @store[index].key

    if @store[left_child].key < @store[right_child].key
      swap(index, left_child)
      return heap_down(left_child)
    else
      swap(index, right_child)
      return heap_down(right_child)
    end


  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end