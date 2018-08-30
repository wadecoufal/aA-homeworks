require 'lru_cache'

describe LRUCache do
  subject(:lru_cache) { LRUCache.new(4)}

  describe "#initialize" do
    it "initializes ivar cache to an empty array" do
      expect(lru_cache.cache).to be_an_instance_of(Array)
      expect(lru_cache.cache).to be_empty
    end
    it "sets ivar max_size to argument passed in" do
      expect(lru_cache.max_size).to eq(4)
    end
  end

  context "when the cache is not empty" do
    before(:each) do
      lru_cache.add("I walk the line")
      lru_cache.add(5)
    end

    describe "#count" do
      it "should return the number of elements in the cache" do
        expect(lru_cache.count).to eq(2)
      end

      it "adding an element should increase the cache count" do
        lru_cache.add(54444)
        expect(lru_cache.count).to eq(3)
      end
    end

    describe "#add(el)" do
      it "when adding an element that already exists in cache, should move element to the end" do
        lru_cache.add("I walk the line")
        expect(lru_cache.cache).to eq([5, "I walk the line"])
      end

      it "should not add multiple instances of the same element" do
        lru_cache.add(7)
        lru_cache.add(7)
        lru_cache.add(7)
        expect(lru_cache.cache).to eq(["I walk the line", 5, 7])
      end

      it "should remove the LRU element if the size of the cache exceeds the capacity" do
        lru_cache.add(7)
        lru_cache.add([1,2,3,4,5])
        lru_cache.add("hey there")
        expect(lru_cache.cache).to eq([5, 7, [1,2,3,4,5], "hey there"])
      end

      it "should handle lots of input" do
        lru_cache.add([1,2,3])
        lru_cache.add(5)
        lru_cache.add(-5)
        lru_cache.add({a: 1, b: 2, c: 3})
        lru_cache.add([1,2,3,4])
        lru_cache.add("I walk the line")
        lru_cache.add(:ring_of_fire)
        lru_cache.add("I walk the line")
        lru_cache.add({a: 1, b: 2, c: 3})
        expect(lru_cache.cache).to eq([[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}])
      end
    end
  end
end
