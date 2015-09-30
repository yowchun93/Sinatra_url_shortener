require 'faker'
require_relative 'app/models/url'
require_relative '../../config/database'
require_relative '../../config/environment'

url = Faker::Internet.url
p url

a = Url.new
a.shorten('test')