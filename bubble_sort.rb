def bubble_sort(arr)
  last_idx = arr.length - 1
  while (last_idx > 0)
    arr.each_with_index do |i, idx|
      if idx == last_idx
        break
      else
        if i > arr[idx + 1]
          arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx] #swap
        end
      end
    end
    last_idx -= 1
  end
  return arr
end

bubble_sort([4, 3, 78, 2, 0, 2])
# => [0,2,2,3,4,78]
