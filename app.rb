require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:project-name.sqlite3"
Dir[__dir__+"/models/*.rb"].each {|file| require file }

get '/posts' do
    #index
    @posts=Post.all
    erb :index
end

get '/posts/new' do
    #new
    erb :new
end

get '/posts/:id' do
    #show
    @post=Post.find(params[:id])
    erb :show
end

get '/users/:id/delete' do

end

post '/posts' do
    #create
    Post.create(description:params[:description])
    @posts= Post.all
    erb :index
end

post '/posts/:id/comments' do
    #create
    comment=params[:comment]
    #comment[:post_id]=params[:id]
    Comment.create(comment)
    p params
    redirect "/posts/#{params[:id]}"
end

get '/users/:id/edit' do
    #edit
end

put '/users/' do
    #update
end

patch '/users/' do
    #update
end

delete '/posts/:id' do
    post = Post.find_by(params[:id])
    post.destroy
    @posts= Post.all
    redirect '/posts'
end
