require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get ('/') do
    erb(:index)
  end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :bookmarks
end

get '/bookmarks/new' do
  erb :new
end

post '/bookmarks' do
  Bookmark.create(url: params[:url])
  redirect '/bookmarks'
end

run! if app_file == $0
end 
