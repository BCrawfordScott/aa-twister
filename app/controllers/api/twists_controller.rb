class Api::TwistsController < ApplicationController
  def index
    # @twists = Twist.all
    # fetch the associated authors at the same time, all in one query
    @twists = Twist.all.includes(:author)
    @users = User.all
    # this gives us too much info, we don't care about created_at
    # render json: @twists

    # this is what we'd have to do without jbuilder
    # obj = {}
    # @twists.each do |t|
    #   obj[t.id] = {id: t.id, author_id: t.author_id, body: t.body}
    # end
    # render json: obj
    render :index
  end

   def show
    @twist = Twist.find(params[:id])
    # render json: @twist
    render :show
  end

   def create
    @twist = Twist.new(twist_params)
    # randomly assign user until frontend authentication
    @twist.author = User.all.sample
     if @twist.save
      render json: @twist
    else
      render json: @twist.errors.full_messages, status: 422
    end
  end
   def twist_params
    params.require(:twist).permit(:body)
  end
end
