class GenresController < ApplicationController
<<<<<<< HEAD

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

=======
>>>>>>> a6b2cdb8321f7d8dcfc85f363e16eec93fc805a7
end
