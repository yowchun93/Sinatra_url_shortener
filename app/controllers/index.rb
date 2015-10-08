get '/' do
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  @urls = Url.all.order(:id)
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
  puts "Post request "
  @new = Url.create(url: params[:url])
  
  p "[LOG] Errors? = #{@new.errors.any?}"
  if @new.errors.any?
    @url = Url.all.order(:id)
    erb :index
  else
    # Replaced with Json 
    # redirect to '/'
    return @new.to_json
  end
end

post '/url/:id/delete' do
  @url = Url.find(params[:id])
  @url.delete
  redirect to '/'
end

