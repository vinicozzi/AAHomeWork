class LRUCache
    def initialize(max_size = 10)
      @max_size = max_size
      @cache = {}
      @queue = []
    end
  
    def count
      @cache.size
    end
  
    def add(el)
      if @cache.key?(el)
        @queue.delete(el)
        @queue.unshift(el)
      else
        if count >= @max_size
          lru = @queue.pop
          @cache.delete(lru)
        end
        @cache[el] = true
        @queue.unshift(el)
      end
    end
  
    def show
      @queue.each { |el| puts el }
    end
  end
  