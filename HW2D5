class LRUCache
  attr_reader :size, :cache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if cache.include?(el)
      #Makes element the most recently used
      cache.delete(el)
      cache << el
    elsif cache.count < size
      cache << el
    else
      cache.shift
      cache << el
    end
  end

  def show
    p cache
  end

  private
end
