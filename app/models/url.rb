require 'securerandom'
require_relative '../../config/database'
require_relative '../../config/environment'

class Url < ActiveRecord::Base
  validates :url, presence: true,
            :format => {:with => URI.regexp},
            uniqueness: true
  before_save :shorten

  def shorten
    short_url = SecureRandom.base64(4)
    self.shortened_url = short_url if self.shortened_url.nil?
  end
end

