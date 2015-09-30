
get '/' do
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  @shortened_url = []
  @url = Url.all
  erb :index
end

get '/:shortened' do
  puts "[LOG] Params: #{params.inspect}"
  url = Url.find_by(shortened_url: params[:shortened]).url
  redirect to "#{url}"
end

post '/urls' do
  # create a new Url
  url = params[:url]
  Url.shorten(url)
  redirect to '/'
end

post '/delete' do
  url = Url.first
  url.delete
  redirect to '/'
end

