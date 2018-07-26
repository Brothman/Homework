class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end
end

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    found = false
    map.each do |array|
      if array[0] == key
        array[1] = value
        found = true
      end
    end

    map << [key, value] unless found
  end

  def get(key)
    value = nil
    map.each do |array|
      if array[0] == key
        value = array[1]
      end
    end
    value
  end

  def delete(key)
    to_delete = nil
    map.each do |array|
      if array[0] == key
        to_delete = array
      end
    end

    map.delete(to_delete) unless to_delete.nil?
  end

  def show
    map
  end

end
