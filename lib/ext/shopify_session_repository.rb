class ShopifySessionRepository
  class ConfigurationError < StandardError; end

    def self.storage=(storage)
      @@storage = storage
    end

    def self.storage
      @@storage.constantize
    end

    def self.retrieve(id)
      validate
      storage.retrieve(id)
    end

    def self.store(session)
      validate
      storage.store(session)
    end

    class ConfigurationError < StandardError; end

    def self.validate
      raise ConfigurationError.new("ShopifySessionRepository.store is not configured!") unless storage
    end

  end
