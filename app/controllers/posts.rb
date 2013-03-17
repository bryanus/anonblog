#create a new post just goes to the form
get "/posts/new" do
  erb :new
end

#on submit, we create the new Post object and save it to the db
post "/posts" do
  puts params
  if @post = Post.create(params[:post])
    string = params[:tags] #  "apple, banana"
    array = string.gsub(" ", "").split(',') #["apple", "banana"]
    array.each do |name|
      #conditional to check if exists or not
      tag = Tag.where(name:name).first
      if tag
        Poststag.create(post_id:@post.id, tag_id:tag.id)
      else #tag is nil
        tag = Tag.create(name:name)
        Poststag.create(post_id:@post.id, tag_id:tag.id)
      end
    end
    redirect "posts/#{@post.id}" #if successful, redirect to post view page
  else #otherwise go back to new post page (change to give error also)
    erb :new
  end
end


#<Poststag id: 1, post_id: 5, tag_id: 1>



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

#delete the post

delete "/posts/:id" do
  @post = Post.find(params[:id])
  @post.destroy
  redirect "/"
end

#show the edit page

get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  puts params
  erb :edit
end 

#update the post
put "/posts/:id" do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect "/posts/#{@post.id}"
  else
    erb :edit
  end
end
