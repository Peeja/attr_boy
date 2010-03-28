require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '../lib')
require 'attr_boy'

class SomeClass
  include AttrBoy
  
  attr_accessor :a_basic_attribute
  
  def a_custom_attribute
    @strange_way_to_store_a_value.reverse
  end
  
  def a_custom_attribute=(value)
    @strange_way_to_store_a_value = value.reverse
  end
end

describe AttrBoy do
  describe "#initialize" do
    it "can take zero arguments, just like Object" do
      lambda { SomeClass.new }.should_not raise_error(ArgumentError)
    end

    it "sets attributes according to the hash it's given" do
      obj = SomeClass.new(:a_basic_attribute => 5,
                          :a_custom_attribute => "hello")
      obj.a_basic_attribute.should == 5
      obj.a_custom_attribute.should == "hello"
    end
  end
end