# You should replace InMemorySessionStore with what you will be using
# in Production
#
# Interface to implement are self.retrieve(id) and self.store(ShopifyAPI::Session)
#
# Here is how you would add these functions to an ActiveRecord:
#

ShopifySessionRepository.storage = "Shop" #InMemorySessionStore
