class Numeric
  
  @@currencies = {"yen" => 0.013, "euro" => 1.292, "rupee" => 0.019, "dollar" => 1.0}
  
  def self.add_currency(name, conversion)
    @@currencies[name.to_s] = conversion
  end
  
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(method_id)
    currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.key?(currency)
      currency == "dollar" ? self * @@currencies[currency] : self / @@currencies[currency]
    else
      "I don't know that conversion."
    end
  end
    
end

class String

  def palindrome?
    str = self.downcase.gsub(/[^a-z]/, '')
    return str == str.reverse
  end
  
end

module Enumerable
  
  def palindrome?
    begin
      return self.to_a == self.to_a.reverse
    rescue NoMethodError
      false
    end
  end
  
end
