class RecommendationEmailJob
  def self.perform(queue, id)
    @queue = queue
    CustomerMailer.recommendation_email(Recommendation.find(id)).deliver
  end
end
