
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])

    redirect "/articles/#{Article.last.id}"
  end

  get '/articles' do
    @articles = Article.all

    erb :index  
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    
    erb :show
  end

  get '/articles/:id/edit' do
    @edit = Article.find(params[:id])
    binding.pry
    erb :edit
  end
  
  patch '/articles/:id' do 
    @edit = Article.find(params[:id])
    @edit.update(params[:article])
  end

  

  #erb :show - displays an individual article
  #erb :index - displays a list of all articles
end
