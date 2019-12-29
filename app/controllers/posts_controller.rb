class PostsController < ApplicationController
    
    get '/posts' do
        authenticate
        @posts = Post.all
        erb :'posts/index'
    end

    #Create a post

   get '/posts/new' do
        authenticate
        @post = current_user.posts.new
        erb :'posts/new'
    end


    post '/posts' do
        authenticate
        u = current_user
        new_chore = u.posts.build(content: params[:content])
        if new_chore.save!
            redirect '/posts'
        else
            @messages = "There was an issue"
            erb :'/posts/new'
        end
    end

    #Delete a chore

    delete '/posts/:id' do
        post = Post.find_by(id: params[:id])
        authenticate_user(@post)
        if post
            post.destroy
            redirect '/posts'
        end
    end

    #Edit a chore
    get '/posts/:id/edit' do
        @post = Post.find_by(id: params[:id])
        
        erb :'posts/edit'
 
    end

    patch '/posts/:id' do
        @post = Post.find_by(id: params[:id])
        authenticate_user(@post)
        @post.update(content: params[:content])
        redirect '/posts'
    end

end 