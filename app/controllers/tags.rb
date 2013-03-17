#index - this shows all l tags

#show - this shows the posts associated with a given tag

get "/tags/:id" do
	@tag = Tag.find(params[:id])
	@posts = @tag.posts
end
