class ReviewRoundStats
  attr_accessor :criteria_stats

  def initialize(criteria_stats)
    @criteria_stats = criteria_stats
  end

  def size
    @criteria_stats.size
  end
end
