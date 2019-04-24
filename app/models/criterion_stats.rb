class CriterionStats
  attr_accessor :mean, :median

  def initialize(criterion_hash)
    criterion_hash[:scores].sort!
    s = criterion_hash[:scores]
    if s.length.even?
      @median = (s[s.length/2].to_f + s[(s.length-2)/2].to_f)/2.0
    else
      @median = s[(s.length-1)/2].to_f
    end
    mean = s.inject{ |sum, el | sum + el }.to_f / s.length
    max = criterion_hash[:max_score]
    min = criterion_hash[:min_score]
    normalized_mean = (mean - min.to_f)/(max.to_f - min.to_f)
    @mean = normalized_mean * 100
  end
end
