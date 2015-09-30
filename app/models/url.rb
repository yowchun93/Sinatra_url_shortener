require 'securerandom'
require_relative '../../config/database'
require_relative '../../config/environment'

class Url < ActiveRecord::Base
  validates :url, presence: true, :format => {:with => URI.regexp}

  def self.shorten(url)
    key = SecureRandom.base64(6)
    Url.create(url: url, shortened_url: key)
  end

end

