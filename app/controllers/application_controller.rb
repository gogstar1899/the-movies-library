# frozen_string_literal: true

# This class is for ApplicationController
class ApplicationController < Sinatra::Base
  register Sinatra::BasicAuth

  configure do
    enable :sessions
    set :views, 'app/views'
    authorize do |username, password|
      username == 'admin' && password == 'admin'
    end
  end

  get '/' do
    erb :index
  end

  protect do
    get '/movies' do
      @movies = Movie.all
      erb :movies
    end
  end

  post '/movies' do
    @movies = Movie.new(params)
    if @movies.save
      redirect '/movies'
    else
      erb :errors
    end
  end

  get '/movies/:id/edit' do
    @movies = Movie.find(params[:id])
    erb :edit_movie
  end

  patch '/movies/:id' do
    movie = Movie.find(params[:id])
    movie.update(params.except("id", "_method"))
    redirect '/movies'
  end

  delete '/movies/:id' do
    Movie.find(params[:id]).destroy
    redirect '/movies'
  end

end
