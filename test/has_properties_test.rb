require File.dirname(__FILE__) + '/abstract_unit'

class HasPropertiesTest < ActiveSupport::TestCase
  test "should create reader" do
    assert_nothing_raised do
      Circle.new.radius
    end
  end
  
  test "should create writer" do
    assert_nothing_raised do
      Circle.new.radius = 5
    end
  end
  
  test "should only make properties available in subclasses" do
    assert_raise NoMethodError do
      Shape.new.radius
    end
  end
  
  test "should serialize properties" do
    circle = Circle.create(:x => 10, :y => 10, :radius => 5)
    assert_equal({ "radius" => 5 }, circle.data)
  end
  
  test "should deserialize properties" do
    circle = Circle.create(:x => 10, :y => 10, :radius => 5)
    assert_equal 5, circle.radius
  end
  
  test "should typecast properties" do
    circle = Circle.create(:x => 10, :y => 10, :radius => '5')
    assert_equal 5, circle.radius
  end
  
  test "should return default null values for properties" do
    circle = Circle.new
    assert_equal 0, circle.radius
  end
  
  test "should accept literal default value" do
    rect = Rectangle.new
    assert_equal 10, rect.width
  end
  
  test "should accept block default values" do
    rect = Rectangle.new
    assert_equal rect.width, rect.height
  end
end
