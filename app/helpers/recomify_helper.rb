module RecomifyHelper
  def shop_url
    Shop.instance.domain
  end
end
