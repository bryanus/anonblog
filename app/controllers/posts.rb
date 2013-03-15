get "/posts/new" do
  @post = Post.new
  erb :"posts/new"
end

post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "posts/#{@post.id}"
  else
    erb :"posts/new"
  end
end

get "posts/:id" do
  post_id = Post.find_by_id(params[:id])
  "heelo"
end  

