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
    @store << HeapNode.new(key, value)
    # check if new node is in order 
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    return nil if @store.empty?
  
    # swap parent node with last node 
    swap(0, @store.length - 1)
    # remove the last node in array
    result = @store.pop
    heap_down(0) unless @store.empty?
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
  # Time complexity: O(n)
  # Space complexity: O(1)
  def empty?
    return @store.length == 0 
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(1)
  def heap_up(index)
    # return if there's only one node 
    return if index == 0 
    # root node is...
    parent = (index-1)/2
    # if node is greater than root, it's in order, do nothing 
    return if @store[index].key > @store[parent].key
    # otherwise, swap the two
    swap(index, parent)
    # check again 
    heap_up(parent)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if @store.empty?

    left_child = 2*index+1
    right_child = 2*index+2

    # if either is nil, can use, so return
    return if @store[left_child].nil? || @store[right_child].nil?
    # otherwise, see which one is smaller
    if @store[left_child].key < @store[right_child].key
      smaller_child = left_child
    else 
      smaller_child = right_child
    end 
    # if parent is larger than smaller, swap INDEXES (not the node itself)
    if @store[index].key > @store[smaller_child].key
      swap(smaller_child, index)
      heap_down(smaller_child)
    end 

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end