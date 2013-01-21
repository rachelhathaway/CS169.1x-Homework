class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s        # make sure it's a string
    attr_reader attr_name             # create the attribute's getter
    attr_reader attr_name+"_history"  # create bar_history getter
    # below: when the name of the attr is changed,
    # check if the history array is defined,
    # if not, create it, update the attr, 
    # push the new attr value to the history array
    class_eval %Q{
      def #{attr_name}=(value)                    
        if !defined? @#{attr_name}_history
          @#{attr_name}_history = [@#{attr_name}]
        end
        @#{attr_name} = value
        @#{attr_name}_history.push(value)
      end
    }
  end
  
end

class Foo
  
  attr_accessor_with_history :bar
  
  def initialize
    @bar
  end

end