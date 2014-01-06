require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'coderay'
ActiveRecord::Base.logger = Logger.new(STDOUT)

require_relative 'config/environments'
set :environment, :development

require_relative 'models/post'

enable :sessions

get '/' do
  redirect '/posts'
end

get '/posts' do
  @highlightz = params[:highlighter]
  if @highlightz == true
    @tester = "The box went through"
  else
    @tester = "it DIDN'T go through"
  end

  @posts = Post.all
  erb :"posts/index"
end


post '/posts/create' do
  title = params[:title]
  body = params[:body]
  post = Post.create(title: title, body: body)
  redirect '/posts'
end


post '/posts/delete' do
  id = params[:id]
  Post.delete(id)
  redirect '/posts'
end