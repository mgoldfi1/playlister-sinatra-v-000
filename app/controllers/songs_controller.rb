require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.create(name: params["song"]["artist"]["name"])
    song = Song.new(name: params[:song][:name])
    song.artist = artist
    song.save
    redirect to("/songs/#{song.slug}")
    binding.pry
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
