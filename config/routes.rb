ActionController::Routing::Routes.draw do |map|
  map.search_query '/search/:query', :controller => 'searches', :action => 'show'
  map.search '/search', :controller => 'searches', :action => 'index'
 
  # Restful Authentication Rewrites
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.change_password '/change_password/:reset_code', :controller => 'passwords', :action => 'reset'
  map.open_id_complete '/opensession', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.open_id_create '/opencreate', :controller => "users", :action => "create", :requirements => { :method => :get }
  
  # Restful Authentication Resources
  
  map.resources :artists do |artists|
    artists.resources :albums do |albums|
      albums.resources :songs do |songs|
        songs.resources :lyrics
      end
    end
  end
  
  map.resources :users, :has_many => :lyrics
  map.resources :searches
  map.resources :artists, :has_many => :albums
  map.resources :songs, :has_one => :album
  map.resources :albums, :has_many => :songs
  map.resources :lyrics
  map.resources :passwords
  map.resource :session
  
  # Home Page
  map.root :controller => 'main', :action => 'index'
  map.help '/help', :controller => 'main', :action => 'help'
  map.about '/about', :controller => 'main', :action => 'about'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
