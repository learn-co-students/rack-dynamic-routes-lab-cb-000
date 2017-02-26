class Item
  attr_accessor :name, :price

  # @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    # @@all << self
  end

  # def self.all?
  #   @@all
  # end

  # def self.get_price_by_name(name)
  #   item = self.all.detect{|i|i.name == name}
  #   item.price
  # end


end
