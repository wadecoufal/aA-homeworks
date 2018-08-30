class LRUCache

    attr_reader :cache, :max_size
    def initialize(size)
      @cache = []
      @max_size = size
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      el_idx = @cache.index(el)
      @cache.delete_at(el_idx) unless el_idx.nil?
      @cache << el

      @cache.shift if count > @max_size
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
    end

    private
    # helper methods go here!

  end
