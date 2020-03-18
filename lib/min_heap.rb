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
  # Time Complexity: (logn) because in the worst case an element inserted at the bottom has to be swapped at 
  # every level from bottom to top up to the root node to maintain the heap property. So essentially you are only traversing half the number of the heap.
  # Space Complexity: O(1) because there will always be one space of memory allocated for a new heap node 
  def add(key, value = key)
    if @store.length == 0
      @store << HeapNode.new(key, value)
      return
    end

    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
    
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: (logn) because after the swapping of the root node and the last node, the last node may have to traverse the tree height (heap down)
  # to satisfy the heap
  # Space Complexity: O(1) because only one space in memory will be created as the algorithm scales.
  def remove()

    return "This heap is empty" if @store.empty?

    swap(0, @store.length - 1)
    result = @store.pop

    heap_down(0)
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
  # Time complexity: O(1) because the algorithm is only checking to see if there are elements in the array. This
  # will stay as the problem scales
  # Space complexity: O(1) because no new memory will be created as the algorithm scales
  def empty?
    if @store[0]
      return
    else
      return false
    end 
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(current_index)
    # the last index is being passed in

    parent_node_index = (current_index + 1)/2 - 1

    while current_index > 0
      if @store[current_index].key < @store[parent_node_index].key
        swap(parent_node_index, current_index)
        current_index = parent_node_index
        parent_node_index = (current_index + 1)/2 - 1
      else  
        return;
      end
    end 
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(current_index)
    # can there be duplicate values in a heap?

    left_child_index = current_index * 2 + 1
    right_child_index = current_index * 2 + 2

    while @store[left_child_index] || @store[right_child_index] 
      # having trouble figuring out when to end the while loop
      if @store[left_child_index].key < @store[right_child_index].key
        swap(current_index, left_child_index)
        current_index = left_child_index
      else 
        swap(current_index, right_child_index)
        current_index = right_child_index
      end 
      left_child_index = current_index * 2 + 1
      right_child_index = current_index * 2 + 2
    end
    
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end

heap = MinHeap.new
#  heap.add(3, "Pasta")
# print heap.add(2, "Soup")
heap.add(3, "Pasta")
heap.add(6, "Soup")
heap.add(1, "Pizza")
heap.add(0, "Donuts")
heap.add(16, "Cookies")
heap.add(57, "Cake")

print heap

