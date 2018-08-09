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
    artist = Artist.find_or_create_by(name: params["song"]["artist"]["name"])
    song = Song.new(name: params[:song][:name])
    song.artist = artist
    params["genres"].each do |id|
      song.genres << Genre.find_by_id(id)
    end
    song.save
    redirect to("/songs/#{song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/edit' do
    artist = Artist.find_or_create_by(name: params["song"]["artist"]["name"])
    song = Song.find_by(name: params[:song][:name])

    genres = []
    params["genres"].each do |id|
      genres << Genre.find_by_id(id)
    end
    song.artist = artist
    song.genres = genres
    song.save
    redirect to("/songs/#{song.slug}")
  end


end
