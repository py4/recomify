class Recommendation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  after_create :send_email

  def send_email
    puts ">>>> sending email <<<"
    CustomerMailer.recommendation_email(self).deliver_later
  end
end
