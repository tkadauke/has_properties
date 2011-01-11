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
  
  test "should support string property" do
    circle = Circle.new(:name => 'foobar')
    assert_equal 'foobar', circle.name
  end
  
  test "should support integer property" do
    circle = Circle.new(:radius => 10)
    assert_equal 10, circle.radius
  end
  
  test "should support boolean property" do
    circle = Circle.new(:filled => true)
    assert_equal true, circle.filled
  end
end
