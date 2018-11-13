

class TwistsController < ApplicationController

  before_action :ensure_logged_in

  def index
    # This controller instance will be garbage collected after this req res cycle
    # All controllers have access to all models (thanks rails)

    # set an instance variable to all the twists
    # We need instance variables for our views!
    # the author info will be included with the twists so no n+1 queries!
    @twists = Twist.all.includes(:author) #because its an instance method- it will be available in the render template.

    # render json of all those twists
    # we can only render once!
    # render json: @twists
    # render :test # this will go to the views/twists/test.html.erb
    render :index # this will go to the views/twists/index.html.erb
  end

  def show
    # params: A hash of all the parameters from the request body
    @twist = Twist.find(params[:id])
    render :show
  end

  def new
    @twist = Twist.new
    render :new
  end

  def create
    # create a new twist with the data provided by the private twist_params method
    @twist = current_user.twists.new(twist_params)

    if @twist.save
      redirect_to twist_url(@twist)
    else
      # Rails defaults to status 200
      # If something went wrong, we have to specify status.
      # render json: twist.errors.full_messages, status: :unprocessable_entity

      # flash is part of rails response cycle to store info temporarily
      # then in our new form, we can render whats in flash if there's anything in there.
      flash.now[:errors] = @twist.errors.full_messages
      # flash.now exists only for this request cycle.
      # flash persists for one additional request cycle.
      render :new, status: 422
    end
  end

  def edit
    @twist = current_user.twists.find(params[:id])
    render :edit
  end

  def update
    # create a new twist with the data provided by the private twist_params method
    twist = current_user.twists.find(params[:id])

    if twist.update(twist_params)
      redirect_to twist_url(twist)
    else
      # Rails defaults to status 200
      # If something went wrong, we have to specify status.
      # render json: twist.errors.full_messages, status: :unprocessable_entity
      flash[:errors] = twist.errors.full_messages
      redirect_to edit_twist_url(twist)
    end
  end

  def destroy
    twist = current_user.twists.find(params[:id])
    twist.destroy
    # redirect_to is given to us by rails.  It
    # twists_url is a method given to us by Rails that returns the path "/twists"
    redirect_to twists_url
  end

  def set_cookie
    maybe_cookie = params[:my_cookie]

    if maybe_cookie
      cookies[:my_cookie] = maybe_cookie
      session[:my_cookie] = maybe_cookie
      # flash[:errors] # lasts till the next lifecycle. for redirecting
      # flash.now[:errors] # lasts till end of this lifecycle. for rendering
      render plain: "I am setting your cookie: #{cookies[:my_cookie]}"
    else
      render plain: "You must provide a cookie"
    end
  end

  def get_cookie
    my_cookie = cookies[:my_cookie]
    if my_cookie
      render plain: "Here's your cookie: #{my_cookie}, and here's your session #{session[:my_cookie]}"
    else
      render plain: "You haven't set a cookie called :my_cookie yet"
    end
  end

  private

  # Strong params: We only want to allow access to specific columns in our DB
  # Params are all the info from the request (including the url, the query string, and the body of the request)
  def twist_params
    # Require the key of "twists" in our params, and then only allow
    # data from the key of "body" under the key of "twist"
    params.require(:twist).permit(:body)


  end
end
