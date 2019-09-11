class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(name)
    @vendors << name

  end

  def vendor_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    names
  end

  def vendors_that_sell(type)
    vendor_with = []
    @vendors.each do |vendor|
      if vendor.inventory.include? type
        vendor_with << vendor
      end
    end
    vendor_with
  end

  def sorted_item_list
    type = []
    @vendors.each do |vendor|
      type << vendor.inventory.keys
    end
    type.flatten.uniq.sort
  end

  def total_inventory
    inventory = Hash.new(0)
    @vendors.each do |vendor|
      inventory.merge!(vendor.inventory) {|key, oldval, newval| oldval + newval}

    end
    inventory
  end

  def sell(type, count)
    @vendors.each do |vendor|
      # require 'pry';binding.pry
      vendor.inventory.each do |name, total|
        if name == type && total <= count
        true
        end
      end
    end

  end

  # def sell(type, count)
  #   @vendors.each do |vendor|
  #     if vendor.inventory.keys.inludes? type && vendor.inventory[type] <= count
  #       true
  #     end
  #   end
  # end


end
