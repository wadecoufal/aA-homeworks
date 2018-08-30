fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish(fish)
  fish_copy = fish.dup

  sorted = false
  until sorted
    sorted = true
    (0...fish_copy.length-1).each do |idx|
      if fish_copy[idx].length > fish_copy[idx+1].length
        fish_copy[idx], fish_copy[idx+1] = fish_copy[idx+1], fish_copy[idx]
        sorted = false
      end
    end
  end

  fish_copy.last
end

# Find the longest fish in O(n log n) time
def dominant(fish)
  sort_by_length(fish).last
end

def sort_by_length(fish)
  return fish if fish.length < 2

  mid = fish.length / 2

  left = sort_by_length(fish.take(mid))
  right = sort_by_length(fish.drop(mid))

  merge(left, right)
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty?
    if left.first.length > right.first.length
      merged << right.shift
    else
      merged << left.shift
    end
  end

  merged + left + right
end


# Find the longest fish in O(n) time.
def clever(fish)
  longest_fish = ""

  fish.each do |f|
    longest_fish = f if f.length > longest_fish.length
  end
  longest_fish
end



tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_arr)
  tiles_arr[direction]
end

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}
def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
