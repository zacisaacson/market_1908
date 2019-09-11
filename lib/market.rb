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







end
