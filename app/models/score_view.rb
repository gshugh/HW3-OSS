class ScoreView < ActiveRecord::Base
  def readonly?
    true
  end

  def self.questionnaire_data(questionnaire_id, response_id)
    self.find_by_sql(["SELECT q1_max_question_score ,SUM(question_weight) as sum_of_weights,SUM(question_weight * s_score) as weighted_score FROM score_views WHERE type in('Criterion', 'Scale') AND q1_id = ? AND s_response_id = ?", questionnaire_id, response_id])[0]
  end
end
