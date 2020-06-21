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
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store.push(new_node)
    
    index = @store.length - 1
    heap_up(index)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def remove()
    if !@store.empty?
      del = @store.first
      @store[0] = @store.last
      @store = @store[0...-1]
      heap_down(0)
    end
    return del.value
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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def heap_up(index)
    i = index

    while i != 0 
      parent_i = get_parent_index(i) 
      p_node =  @store[parent_i]
      a_node = @store[i]
      if p_node.key > a_node.key
        swap(parent_i, i) 
      end 
      i = parent_i
    end
  end

  def get_parent_index(index)
    return (index - 1) / 2
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_i = index * 2 + 1
    right_i = index * 2 + 2

    if right_i < @store.length
      min_child = @store[left_i].key < @store[right_i].key ? left_i : right_i

      if @store[index].key > @store[min_child].key
        swap(index, min_child)
        heap_down(min_child)
      end
    elsif left_i < @store.length
      if @store[index].key > @store[left_i].key
        swap(index, left_i)
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