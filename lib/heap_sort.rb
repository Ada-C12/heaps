require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn)
# Space Complexity: O(1)
def heapsort(list)
  size = list.length()
  size.times do |index|
    heap_up(list, index)
  end
  
  size.times do |index|
    swap(list, 0, size - 1 - index)
    heap_down(list, size - 1 - index)
  end
  return list
end

def heap_up(list, index)
  current = index
  parent_index = (current % 2 == 0) ? current/2 - 1 : current/2
  while current > 0 && list[current] > list[parent_index]
    swap(list, current, parent_index)
    current = parent_index
    parent_index = (current % 2 == 0) ? current/2 - 1 : current/2
  end
end

def heap_down(list, last)
  current = 0
  left = 1
  while (current < last) && (left < last)
    bigger = left
    right = left + 1
    bigger = right if right < last && list[right] > list[left]
    
    break if list[current] > list[bigger]
    swap(list, current,  bigger)
    current = bigger
    left = 2*current + 1
  end
end

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end