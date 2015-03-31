class Recommendation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  after_create :send_email

  def send_email
    puts ">>>> sending email <<<"
    Resque.enqueue(RecommendationEmailJob, :customers_email_queue, id)
  end
end
