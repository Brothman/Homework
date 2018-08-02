def quadratic_search(array)
  array.each_with_index do |fish1, index1|
    max_length = true

    array.each_with_index do|fish2, index2|
      if index1 == index2
        next
      end
      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
  end
  nil
end

class Array
  #this should look familiar
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

#We use mergesort because it sorts in nlogn time and we pass the proc to put the longest fish at the beginning
def nlogn_search(array)
  #sorting from the longest to the shortest
  prc ||=  Proc.new {|x, y| y.length <=> x.length}
  #return the first eleemtn
  array.merge_sort(&prc)[0]
end

def linear_search(array)

  biggest_fish = array.first
  array.each do |fish|
    if fish.length > biggest_fish.length
      #update biggest fish
      biggest_fish = fish
    end
  end
  biggest_fish
end

#  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(direction, tiles_array)
  tiles_array.each.with_index do |direct, index|
    if direct == direction
      index
    end
  end
  nil
end

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  'down' => 4,
  "left-down" => 5,
  'left'=> 6,
  "left-up" => 7
}

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end
