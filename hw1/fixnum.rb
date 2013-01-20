# adds new methods to the already defined 
# Fixnum class; example of being allowed
# to change Ruby's built-in classes

class Fixnum
  
  def seconds; self; end
  
  def minutes; self * 60; end
  
  def hours; self * 60 * 60; end
  
  def days; self * 60 * 60 * 24; end
  
  def ago; Time.now - self; end
  
  def from_now; Time.now + self; end

  def method_missing(method_id, *args)
    name = method_id.to_s
    if name =~ /^(second|minute|hour|day)$/
      self.send(name + 's')
    else
      super
    end
  end
  
end

# examples
# >> 5.seconds
# => 5
# >> 5.minutes
# => 300
# >> 5.hours
# => 18000
# >> 5.ago
# => Sat Jan 19 11:11:56 -0600 2013
# >> 5.minutes.ago
# => Sat Jan 19 11:07:15 -0600 2013
# >> 5.hours.ago
# => Sat Jan 19 06:12:21 -0600 2013
# >> 5.hours.from_now
# => Sat Jan 19 16:12:30 -0600 2013
# >> 5.minutes.from_now
# => Sat Jan 19 11:17:36 -0600 2013
