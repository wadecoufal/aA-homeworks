class Map

  def initialize
    @map = []
  end

  def set(key, val)
    if self.include?(key)
      self.delete(key)
      @map << [key, val]
    else
      @map << [key, val]
    end
  end

  def get(key)
    @map.each do |kv|
      k, v = kv
      return v if k == key
    end
    nil
  end

  def include?(key)
    @map.each do |kv|
      return true if kv.first == key
    end
    false
  end

  def delete(key)
    delete_index = nil
    @map.each_with_index do |kv, idx|
      k = kv.first
      delete_index = idx if k == key
    end
    @map.delete_at(delete_index) unless delete_index == nil
  end

  def show
    p @map
  end
end
