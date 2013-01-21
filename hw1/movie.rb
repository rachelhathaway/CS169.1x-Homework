class Movie
  
  # attr_accessor :title
  # attr_accessor :year
  
  def initialize(title, year)
    @title = [title]
    @year = year
  end
  
  def title
    @title
  end
  
  def title=(new_title)
    @title = new_title
  end
  
  def year; @year; end
  
  def year=(new_year); @year = new_year; end
  
  @@include_year = false
  
  # Movie.include_year == self.include_year
  def Movie.include_year=(new_value)
    @@include_year = new_value
  end
  
  def full_title
    if @@include_year
      "#{self.title} (#{self.year})"
    else
      self.title
    end
  end
  
end

beautiful = Movie.new("Life is Beautiful", "1997")

# What's the movie's name?
puts "I'm seeing #{beautiful.full_title}."

# with the year
Movie.include_year = true
puts "I'm seeing #{beautiful.full_title}."

# Change the title.
beautiful.title = "La vita e bella"