require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get ('/') do
    erb(:index)
  end

get '/bookmarks' do
  @bookmarks = BookmarkManager.all
  erb :bookmarks
end

get '/bookmarks/new' do
  erb :new

end


post '/bookmarks' do
  time = Time.now
  BookmarkManager.create(url: params[:url], title: params[:title])
  redirect '/bookmarks'
end

run! if app_file == $0
end
