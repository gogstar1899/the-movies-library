# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'rake'
require 'require_all'
require 'pg'
require 'rack-flash'

set :database, {adapter: "postgresql", database: "movies"}

require_all 'app'