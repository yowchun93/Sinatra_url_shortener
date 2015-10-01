require 'securerandom'
require_relative '../../config/database'
require_relative '../../config/environment'

class Url < ActiveRecord::Base
  validates :url, presence: true,
            :format => {:with => URI.regexp},
            uniqueness: true

  def self.shorten(url)
    key = SecureRandom.base64(4)
    Url.create(url: url, shortened_url: key)
  end

end

