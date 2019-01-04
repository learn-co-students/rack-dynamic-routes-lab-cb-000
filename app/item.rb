class Item
  attr_accessor :name, :price
  @@all = []

  def self.all
    @@all
  end

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end

  def self.find_by_name(name)
    @@all.find do |item|
      item.name == name
    end
  end

end

#gun = Item.new('glock', '$5')
#puts Item.find_by_name('cock') == nil
#puts Item.all
