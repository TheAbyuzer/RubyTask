Rails.application.routes.draw do
  resources :comments
  # Authentication Routes
  	#Login
  	post 'login', to: 'authentication#authenticate'
  	#Register
  	post 'register', to: 'authentication#register'


  # Posts Routes
  	# Fetch Posts
  	get 'posts', to:'posts#getposts'
  	get 'posts/:id', to:'posts#getpostbyId'
  	#Add Posts
  	post 'posts',to:'posts#addpost'
  	#Update Posts
  	put 'posts/:id', to:'posts#updatepost'
  	patch 'posts/:id', to:'posts#updatepost'
   	#Update Post Tags
  	put 'posts/:id/tags', to:'posts#updateposttags'
  	patch 'posts/:id/tags', to:'posts#updateposttags'
    #Delete Post 
  	delete 'posts/:id', to:'posts#deletepost'

  #Comments
  	# Fetch Post Comments
  	get 'posts/:id/comments',to:'comments#getcomments'
  	# Add Comment
  	post 'posts/:id/comments',to:'comments#addcomment'
  	# Edit Comment
  	patch 'posts/:id/comments/:comment_id',to:'comments#updatecomment'
  	put 'posts/:id/comments/:comment_id',to:'comments#updatecomment'
end
