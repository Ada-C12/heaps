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
  # Time Complexity:  generally O(log n) because of heap_up;
  #                   O(n log n) if you have to make a new bigger store and move everything over
  # Space Complexity: O(log n) because of heap_up
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity:  O(log n) because of heap_down
  # Space Complexity: O(log n) because of heap_down
  def remove()
    swap(0, @store.length - 1)
    removed_node = @store.pop()
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
  # Time complexity:  O(1)
  # Space complexity: O(1)
  def empty?
    return @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity:  O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    parent_index = get_parent(index)
    if @store[parent_index].key > @store[index].key
      swap(parent_index, index)
      if parent_index > 0
        heap_up(parent_index)
      end
    end
    return
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = get_left_child(index)
    right_child = get_right_child(index)

    unless @store[left_child].nil? && @store[right_child].nil?
      if !@store[left_child].nil? && @store[right_child].nil?
        smallest_child = left_child
      elsif @store[left_child].nil? && !@store[right_child].nil?
        smallest_child = right_child
      elsif @store[left_child].key < @store[right_child].key
        smallest_child = left_child
      else
        smallest_child = right_child
      end

      if @store[smallest_child].key < @store[index].key
        swap(smallest_child, index)
        heap_down(smallest_child)
      end
    end
    return
  end

  def get_left_child(index)
    return (index * 2) + 1
  end

  def get_right_child(index)
    return (index * 2) + 2
  end

  def get_parent(index)
    return (index - 1) / 2
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end