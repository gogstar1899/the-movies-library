# frozen_string_literal: true

# This class is for ApplicationController
class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/movies' do
    @movies = Movie.all
    erb :movies
  end

  post '/movies' do
    Movie.create(params)
    redirect '/movies'
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
