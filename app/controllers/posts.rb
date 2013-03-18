#create a new post just goes to the form
get "/posts/new" do
  erb :new
end

#on submit, we create the new Post object and save it to the db
post "/posts" do
  
  if @post = Post.create(params[:post]) #if post was created successfully
    string = params[:tags] # "apple, banana"
    array = string.gsub(" ", "").split(',') #["apple", "banana"]
    array.each do |name|
      #conditional to check if tag exists or not
      tag = Tag.where(:name => name).first
      if tag #exists, update the poststags table with the ids
        Poststag.create(:post_id => @post.id, :tag_id => tag.id)
      else #tag is nil; create it first
        tag = Tag.create(:name => name)
        Poststag.create(:post_id => @post.id, :tag_id => tag.id)
      end
    end
    redirect "posts/#{@post.id}" #if successful, redirect to post view page
  else #otherwise go back to new post page
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
  #
  if @post.update_attributes(params[:post])
    string = params[:tags] #  "apple, banana"
    array = string.gsub(" ", "").split(',') #["apple", "banana"]
    array.each do |name|
      #conditional to check if tag exists or not
      tag = Tag.where(:name => name).first
      if tag #exists, update the poststags table with the ids
        Poststag.create(:post_id => @post.id, :tag_id => tag.id)
      else #tag is nil; create it first
        tag = Tag.create(:name => name)
        Poststag.create(:post_id => @post.id, :tag_id => tag.id)
      end
    end
    
    redirect "/posts/#{@post.id}"
  else
  
    erb :edit
  end
end 
