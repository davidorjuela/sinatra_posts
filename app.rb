require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:project-name.sqlite3"
Dir[__dir__+"/models/*.rb"].each {|file| require file }

get '/posts' do
    #index
    @posts=Post.all
    erb :index
end

get '/users/:id' do
    #show
end

get '/users/:id/delete' do

end

get '/posts/new' do
    #new
    erb :new
end

post '/posts' do
    #create
    Post.create(description:params[:description])
    @posts= Post.all
    erb :index
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
    post = Post.find(params[:id])
    post.destroy
    @posts= Post.all
    redirect index
end
