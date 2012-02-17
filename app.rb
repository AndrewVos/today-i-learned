require "sinatra/base"
require "mongo_mapper"

if ENV["MONGOHQ_URL"]
  uri = URI.parse(ENV['MONGOHQ_URL'])
  MongoMapper.connection = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  MongoMapper.database = uri.path.gsub(/^\//, '')
else
  MongoMapper.connection = Mongo::Connection.new('localhost')
  MongoMapper.database = "til"
end

require_relative "lib/til"
require_relative "lib/user"

class TilApp < Sinatra::Base
  get '/tils/new' do
    haml(:tils_new)
  end

  get '/tils/:id/edit' do
    haml :tils_edit
  end

  get '/tils' do
    render_tils
  end

  post '/tils/:id' do
    til = current_user.tils.find(params[:id])
    til.value = params[:TIL]
    til.save
    haml :tils_edit
  end

  def current_user
    @current_user || User.first(:name => "Aidy") || User.create(:name => "Aidy")
  end

  post '/tils' do
    user = current_user
    user.tils << Til.new(:value => params[:TIL])
    user.save
    render_tils
  end

  get '/login' do
    haml :login
  end

  post '/login' do
    user = params[:user]
    pwd = params[:pwd]
    @current_user = User.first(:name => user, :password => pwd)
    render_tils
  end

  def til
    @til ||= current_user.tils.find(params[:id])
  end

  def render_tils
    @tils = current_user.tils
    haml(:tils_index)
  end
end

TilApp.run! if $0 == __FILE__
