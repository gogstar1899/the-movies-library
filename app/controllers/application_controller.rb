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

    post '/movies' do
      data = request.content_type == 'application/json' ? JSON.parse(request.body.read) : params
      @movies = Movie.new(data)
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
      if @movies.empty?
        halt 404, { error: 'Movie not found' }.to_json
      else
        @movies.to_json
      end
      # erb :movies
    end

    get '/movies/sort' do
      @movies = Movie.order(params[:sort])
      @movies.to_json
      # erb :movies
    end

    patch '/movies/:id' do
      data = request.content_type == 'application/json' ? JSON.parse(request.body.read) : params
      @movies = Movie.find_by(id: params[:id])
      if @movies&.update(data.except('id', '_method'))
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

  protect do
    get '/actors' do
      @actors = Actor.all
      @actors.to_json
    end

    post '/actors' do
      data = request.content_type == 'application/json' ? JSON.parse(request.body.read) : params
      @actors = Actor.new(data)
      if @actors.save
        @actors.to_json
      else
        { errors: @actors.errors.full_messages }.to_json
      end
    end

    get '/actors/sort' do
      @actors = Actor.order(params[:sort])
      @actors.to_json
    end

    get '/actors/search' do
      query = "%#{params[:search]}%"
      birthdate_query = begin
        params[:search].to_date
      rescue StandardError
        nil
      end
      oscar_query = if params[:search].downcase == 'true'
                      true
                    else
                      params[:search].downcase == 'false' ? false : nil
                    end
      @actors = Actor.where('name LIKE :q OR description LIKE :q OR birthdate = :b OR oscar = :o',
                            q: query, b: birthdate_query, o: oscar_query)
      if @actors.empty?
        halt 404, { error: 'Actor not found' }.to_json
      else
        @actors.to_json
      end
    end

    get '/actors/:id/edit' do
      @actors = Actor.find_by_id(params[:id])
      @actors ? @actors.to_json : { error: 'Actor not found' }.to_json
    end

    patch '/actors/:id' do
      data = request.content_type == 'application/json' ? JSON.parse(request.body.read) : params
      @actors = Actor.find_by(id: params[:id])
      if @actors&.update(data.except('id', '_method'))
        @actors.to_json
      else
        status 404
        { error: 'Actor not found or update failed' }.to_json
      end
    end

    delete '/actors/:id' do
      @actors = Actor.find_by(id: params[:id])
      if @actors
        @actors.destroy
        { message: 'Actor successfully deleted' }.to_json
      else
        status 404
        { error: 'Actor not found' }.to_json
      end
    end
  end
end
