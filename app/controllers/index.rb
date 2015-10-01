get '/' do
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  @url = Url.all.order(:id)
  erb :index
end

get '/:shortened' do
  puts "[LOG] Params: #{params.inspect}"
  url = Url.find_by(shortened_url: params[:shortened])
  url.clicks += 1
  url.save
  redirect to "#{url.url}"
end

post '/urls' do
  # create a new Url
  @new = Url.create(url: params[:url])
  p "[LOG] Errors? = #{@new.errors.any?}"
  if @new.errors.any?
    @url = Url.all.order(:id)
    erb :index
  else
    redirect to '/'
  end
end

post '/delete' do
  url = Url.first
  url.delete
  redirect to '/'
end

