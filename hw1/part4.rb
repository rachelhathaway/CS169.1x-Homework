class Dessert
  
  attr_accessor :name
  attr_accessor :calories
  
  def initialize(name, calories)
    # YOUR CODE HERE
    @name = name
    @calories = calories
  end
  
  def healthy?
    # YOUR CODE HERE
    return calories < 200 ? true: false
  end
  
  def delicious?
    # YOUR CODE HERE
    return true
  end
end

class JellyBean < Dessert
  
  attr_accessor :flavor
  
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def delicious?
    # YOUR CODE HERE
    return @flavor.downcase == "black licorice" ? false: true
  end
end
