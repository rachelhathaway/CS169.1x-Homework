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


class Account
  
  attr_accessor :name, :pin
  attr_reader :balance
  
  def initialize(name, pin, balance=0)
    @name = name
    @pin = pin
    @balance = balance
  end
  
  def deposit(pin, amount)
    correct_pin?(pin) { @balance += amount }
  end
  
  def withdraw(pin, amount)
    correct_pin?(pin) {
      if @balance >= amount
        @balance -= amount
      else
        "You don't have enough money to do that."
      end
    }
  end
  
  def correct_pin?(pin)
    if @pin == pin
      yield
    else
      "You entered an incorrect pin."
    end
  end 
  
end