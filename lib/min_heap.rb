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
  # Time Complexity: log(n)
  # Space Complexity: log(n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    return heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: log(n)
  # Space Complexity: log(n)
  def remove()
    return nil if @store.empty?
    swap(0, @store.length - 1)

    removed = @store.pop
    heap_down(0) unless @store.empty?
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
  # Time complexity: O(n)
  # Space complexity: O(1)
  def empty?
    return true if @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: log(n)
  # Space complexity: log(n)
  def heap_up(index)
    parent_index = (index - 1) / 2
    return nil if @store.empty?
    return if index == 0 || @store[index].key >= @store[parent_index].key

    swap(index, parent_index)
    return heap_up(parent_index)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    lc_index = index * 2 + 1
    rc_index = index * 2 + 2
    return if @store[lc_index].nil? && @store[rc_index].nil?
    return if index == @store.length - 1

    if @store[rc_index].nil? && @store[lc_index].key <= @store[index].key
      return swap(index, lc_index)
    elsif @store[rc_index].nil? && @store[lc_index].key > @store[index].key
      return
    end

    return unless @store[lc_index].key <= @store[index].key && @store[rc_index].key <= @store[index].key
    if @store[lc_index].key <= @store[rc_index].key
      swap(index, lc_index)
      return heap_down(lc_index)
    else
      swap(index, rc_index)
      return heap_down(rc_index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end