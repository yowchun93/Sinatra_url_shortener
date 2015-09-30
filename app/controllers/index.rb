get '/' do
  @shortened_url = []
  @url = Url.all
  # Url.all.each do |x|
  #   @url << x.url
  #   @shortened_url << x.shortened_url
  # end
  # Look in app/views/index.erb
  erb :index
end

get '/:shortened' do
  url = Url.find_by(shortened_url: params[:shortened]).url
  redirect to "#{url}"
end
post '/aunty' do
  speech = params[:user_input]
  redirect to("/?aunty=#{speech}")
end

# get '/' do
#   # let user create new short URL, display a list of shortened URLs
# end

post '/urls' do
  # create a new Url
  url = params[:url]
  Url.shorten(url)
  redirect to '/'
end

get '/urls' do
  @urls = Url.all.shortened_url
  erb :urls
end

post '/delete' do
  url = Url.first
  url.delete
  redirect to '/'
end

