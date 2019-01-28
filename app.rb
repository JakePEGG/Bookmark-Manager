require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get ('/') do
    erb(:index)
  end

  get('/bookmarks') do
  end
  
  run! if app_file == $0

end
