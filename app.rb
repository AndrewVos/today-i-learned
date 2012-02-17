require "sinatra/base"
require "mongo_mapper"
require_relative "lib/til"

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
    til = Til.find(params[:id])
    til.value = params[:TIL]
    til.save
    haml :tils_edit
  end

  post '/tils' do
    Til.create(:value => params[:TIL]).save
    render_tils
  end

  def til
    @til ||= Til.find(params[:id])
  end

  def render_tils
    @tils = Til.all
    haml(:tils_index)
  end
end

TilApp.run! if $0 == __FILE__
