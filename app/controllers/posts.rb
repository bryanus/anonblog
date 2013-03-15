#create a new post just goes to the form
get "/posts/new" do
  erb :new
end

#on submit, we create the new Post object and save it to the db
post "/posts" do
  if @post = Post.create(params[:post])
    redirect "posts/#{@post.id}" #if successful, redirect to post view page
  else #otherwise go back to new post page (change to give error also)
    erb :new
  end
end

#show the post requested
get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :show
end  

#view all posts as links
get '/' do
  @posts = Post.all
  erb :posts
end  
