#show - this shows the posts associated with a given tag

get "/tag/:id" do
	@tag = Tag.find(params[:id])
	puts @tag
	@posts = @tag.posts

	erb :tag_posts
end
