require 'uri'
require 'json'
require 'net/http'

module BadgesEngine
  class Assertion < ActiveRecord::Base

    include BadgesEngine::Engine.routes.url_helpers

    belongs_to :badge

    validates_presence_of :badge_id
    validates_presence_of :user_id

    validates_associated :badge

    before_validation(:on=>:create) do
      self.token = SecureRandom.urlsafe_base64(16)
    end

    class <<self
      def associate_user_class(user_class)
        belongs_to :user, :class_name=>user_class.to_s, :foreign_key=>'user_id'
      end
    end

    def recipient
      'sha256$' + Digest::SHA256.hexdigest(self.user.try(:email) + salt)
    end

    def salt
      BadgesEngine::Configuration.salt
    end

    def baking_callback_url
      origin_uri = URI.parse(BadgesEngine::Configuration.issuer.origin)
      secret_assertion_url(:id=>self.id, :token=>self.token, :host=>origin_uri.host)
    end

    def bake
      uri = URI.parse(BadgesEngine::Configuration.baker_url)
      uri.query = URI.encode_www_form({assertion: self.baking_callback_url})
      logger.info "URL: #{uri}"
      response = Net::HTTP.get_response(URI.encode(uri))
      logger.info "Response: #{response.inspect}"

      return response.body if response.kind_of?(Net::HTTPSuccess)

      if !response || response.body.blank?
        raise "Baking badge failed: Response was blank:\n\t'#{response.inspect}'"
      else
        raise "Baking badge failed: Response was not a success:\n\t'#{response.inspect}'"
      end
    end

    def as_json(options={})
      super(only: [:evidence, :expires, :issued_on], methods: [:recipient, :salt],
            include: { badge: { only: [:version, :name, :image, :description, :criteria], methods: :issuer} })
    end

  end
end
