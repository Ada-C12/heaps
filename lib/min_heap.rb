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
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store.push(HeapNode.new(key,value))
    heap_up(@store.length - 1) if @store.length - 1 != 0 
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O (log n)
  def remove()
    swap(0, @store.length - 1)
    deleted = @store.pop()
    heap_down(0) unless self.empty?
    return deleted.value() 
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
    return true if @store.empty? 
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O (log n)
  # Space complexity: O(log n)
  # Formula 
  # left_child - 2 * i + 1 
  # right_child - 2 * i + 2 
  def heap_up(index)
    if index.even?
      parent_index = (index - 2)/2 
    elsif index.odd?
      parent_index = (index - 1)/2 
    end 

      if @store[index].key < @store[parent_index].key
        swap(parent_index, index)
        heap_up(parent_index) if parent_index != 0 
      end 

  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    return if self.empty?
    left_child = 2 * index + 1 
    right_child = 2 * index + 2 
    if @store[left_child] == nil 
      return 
    elsif @store[right_child] == nil || @store[left_child].key < @store[right_child].key
      smallest_child = left_child 
    elsif @store[left_child].key > @store[right_child].key
      smallest_child = right_child 
    end 

    if @store[index].key > @store[smallest_child].key
      swap(smallest_child, index)
      heap_down(smallest_child) 
    end 

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end