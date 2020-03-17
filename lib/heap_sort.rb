

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(1)
def heap_sort(list)
  length = list.length 
  build_max_heap(list)

  last_el = length - 1
  while last_el > 0 do 
    swap(list, 0, last_el)
    heapify(list, last_el, 0)
    last_el -= 1
  end 

  return list
end



def build_max_heap(array)
  curr_node = array.length / 2 - 1
  while curr_node >= 0 do 
    heapify(array, array.length, curr_node)
    curr_node -= 1
  end 
end 

def heapify(list, length, i)
  largest = i
  if left_child(i) < length && list[left_child(i)] > list[i]
    largest = left_child(i)
  end 
  if right_child(i) < length && list[right_child(i)] > list[largest]
    largest = right_child(i)
  end 
  if largest != i
    swap(list, i, largest)
    heapify(list, length, largest)
  end 
end 

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end 

def left_child(index)
  return 2 * index + 1
end 

def right_child(index)
  return 2 * index + 2
end 

