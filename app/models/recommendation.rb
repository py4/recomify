class Recommendation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  after_create :send_email

  def send_email
    content = File.read(File.join('app', 'templates', 'recommendation_email.html.erb'))
    return ERB.new(content).result(OpenStruct.new(customer: customer, recommendation: self, product: product).instance_eval { binding })
  end
end
