

# This method uses a heap to sort an array.
# Time Complexity:  (nLogn) because heapify is (logn) and building the heap is 
# O(n)
# Space Complexity: O(1)
def heap_sort(array)  
  size = array.length
  #Adding an empty element at beginning of array to be the root
  root_array = [nil] + array            
  
  i = size / 2 
  while i > 0 do
    heapify(root_array, i, size) 
    i -= 1 
  end  

  while size > 1  do
    root_array[1], root_array[size] = root_array[size], root_array[1]  
    size -= 1  
    heapify(root_array, 1, size)  
  end  
  root_array.shift #getting rid of the initial nil
  root_array                  
end

def heapify(array, parent, limit)  
  root = array[parent]  

  while (child_node = 2 * parent) <= limit  do
      if child_node < limit and array[child_node] < array[child_node + 1]  
          child_node += 1 
      end 
      break  if root >= array[child_node]  
      array[parent] = array[child_node]  
      parent = child_node  
  end  
  array[parent] = root 
end  


