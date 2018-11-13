Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # HTTP verbs: GET, POST, PATCH/PUT, DELETE

  # The router interprets the request path and verb and sends the request to the appropriate controller

  # When we make a GET request to "/twists"
  # go to the twists controller and call the index method
  # get "/twists", to: "twists#index"
  #
  # # :id is a wildcard.  It is a variable representing an id for the record we're looking for
  # # HTTP is stateless, so we need to give the request which twist we want to operate on
  # get "/twists/:id", to: "twists#show"
  # # create a twists
  # post "/twists", to: "twists#create"
  #
  # # update a twist
  #
  # patch "/twists/:id", to: "twists#update"
  # put "/twists/:id", to: "twists#update"
  #
  # # delete a twist
  # delete "/twists/:id", to: "twists#destroy"

  # The easier way to create routes:
  # The order in the only array doesn't matter, but they do need to
  # the appropriate REST API method names
  # Index reads all the twists
  # Show reads only one twist
  resources :twists, only: [:show, :create, :update, :destroy, :index, :new, :edit] # do
    # collection says that the paths do not need a wild card.
    # if I needed a wild card in the path - we would do a member do block.
    # collection do
    #   get :get_cookie
    #   get :set_cookie
    # end
  # end
# resource only creates one session at a time for the controller.
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :destroy]

  # whenever go to / should go to a specific controller.
  root to: 'static_pages#root'

  namespace :api, defaults: { format: 'json' } do
    resources :twists
    resources :users, only: [:create, :show, :index]
    resource :session, only: [:create, :destroy]
  end
end
