# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:'bookmarks/index')
  end

  get '/add_bookmark' do
    erb(:'bookmarks/add_bookmark')
  end

  post '/submit_bookmark' do
    Bookmarks.add_bookmark(params[:url], params[:title])
    redirect('/bookmarks')
  end
  
  run! if app_file == $PROGRAM_NAME
end
