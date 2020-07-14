def bubble_sort(arr)
  last_idx = arr.length - 2
  while (last_idx > 0)
    swaped = false
    0.upto(last_idx).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swaped = true
      end
    end
    if not swaped
      break
    end
    last_idx -= 1
  end
  return arr
end

bubble_sort([4, 3, 78, 2, 0, 2])
# => [0,2,2,3,4,78]
