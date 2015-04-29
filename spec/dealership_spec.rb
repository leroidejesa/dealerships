require('rspec')
require('dealership')
require('vehicle')
require('pry')

describe(Dealership) do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it("returns the name of the dealership") do
      test_dealership = Dealership.new("PDX Cars")
      expect(test_dealership.name()).to(eq("PDX Cars"))
    end
  end

  describe('#id') do
    it("returns the id of the dealership") do
      test_dealership = Dealership.new("PDX Cars")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it("initialy returns an empty array of cars for the dealership") do
      test_dealership = Dealership.new("PDX Cars")
      expect(test_dealership.cars()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a dealership to the array of saved dealerships") do
      test_dealership = Dealership.new("PDX Cars")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe ('.find') do
    it("returns a dealership by its id number") do
      test_dealership = Dealership.new("PDX Cars")
      test_dealership.save()
      test_dealership2 = Dealership.new("SEA Cars")
      test_dealership2.save()
      expect(Dealership.find(test_dealership2.id())).to(eq(test_dealership2))
    end
  end

  describe('#add_vehicle') do
    it("adds a new vehicle to the dealership") do
      test_dealership = Dealership.new("PDX Cars")
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end
end
