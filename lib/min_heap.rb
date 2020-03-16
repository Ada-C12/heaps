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
  # Space Complexity: 0(1)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def remove
    if @store.empty?
      return nil
    end
  
    swap(0, @store.length - 1)
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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.


  # Time complexity: O(logn)
  # Space complexity: O(1)
  def heap_up(index)
  # Compare the new node with it's parent
  # If they are out of order swap and heap-up
  # using the parent's index number.
    parent = (index -1) / 2
    if index != 0 && @store[index].key < @store[parent].key
      temp = @store[index]
      @store[index] = @store[parent]
      @store[parent]= temp
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left = index * 2 + 1
    right = index * 2 + 2

    if left < @store.length && right < @store.length
      if @store[left].key < @store[right].key
        if @store[index].key > @store[left].key 
          temp = @store[index]
          @store[index] = @store[left]
          @store[left]= temp
          heap_down(left)
        end
      else
        if @store[index].key > @store[right].key 
          temp = @store[index]
          @store[index] = @store[right]
          @store[right]= temp
          heap_down(right)
        end
      end
    elsif left < @store.length
      if @store[index].key > @store[left].key 
        temp = @store[index]
        @store[index] = @store[left]
        @store[left]= temp
        heap_down(left)
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