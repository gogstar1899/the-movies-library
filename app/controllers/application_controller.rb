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
    { message: 'Welcome' }.to_json
    # erb :index
  end

  protect do
    get '/movies' do
      @movies = Movie.all
      @movies.to_json
      # erb :movies
    end

    get '/actors' do
      @actors = Actor.all
      @actors.to_json
    end
  end

  post '/movies' do
    @movies = Movie.new(params)
    if @movies.save
      @movies.to_json
      # redirect '/movies'
    else
      { errors: @movies.errors.full_messages }.to_json
      # erb :errors
    end
  end

  get '/movies/:id/edit' do
    @movies = Movie.find_by_id(params[:id])
    @movies ? @movies.to_json : { error: 'Movie not found' }.to_json
    # erb :edit_movie
  end

  get '/movies/search' do
    query = "%#{params[:search]}%"
    @movies = Movie.where('name LIKE :q OR director LIKE :q OR main_actor LIKE :q OR year = :y', q: query,
                                                                                                y: params[:search].to_i)
    @movies.to_json
    # erb :movies
  end

  get '/movies/sort' do
    @movies = Movie.order(params[:sort])
    @movies.to_json
    # erb :movies
  end

  patch '/movies/:id' do
    @movies = Movie.find_by(id: params[:id])
    if @movies&.update(params.except('id', '_method'))
      @movies.to_json
      # redirect '/movies'
    else
      status 404
      { error: 'Movie not found or update failed' }.to_json
      # halt 404, 'Movie not found'
    end
  end

  delete '/movies/:id' do
    @movies = Movie.find_by(id: params[:id])
    if @movies
      @movies.destroy
      { message: 'Movie successfully deleted' }.to_json
      # redirect '/movies'
    else
      status 404
      { error: 'Movie not found' }.to_json
      # halt 404, 'Movie not found'
    end
  end

end
