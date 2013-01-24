class CartesianProduct
  
  attr_reader :cp
  
  include Enumerable
  
  def initialize(seq1, seq2)
    @seq1 = seq1
    @seq2 = seq2
    @cp = []
  end
  
  def get_cp
    @seq2.each do |x|
      @seq1.each do |y|
        @cp.push([y,x])
      end
    end
    return @cp.empty? ? nil : @cp
  end
  
  def each 
    @cp = self.get_cp
    begin
      @cp.each { |product| yield product }
    rescue NoMethodError
    end
  end  
    
end
