class GoalsController < ApplicationController
  include SocialStream::Controllers::Objects
  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end
  
   # GET /goals/preset
  # GET /goals/preset.json
  def preset
 
    @goal = Goal.new

    respond_to do |format|
      format.html # preset.html.erb
      format.json { render json: @goal }
    end
  end
end

# GET /goals/1
# GET /goals/1.json
def progress
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # progress.html.erb
      format.json { render json: @goal }
    end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def permitted_params
      params.require(:goal).permit(:date, :description, :name, :priority, :status)
    end
    
    def allowed_params
      [:date, :description, :name, :priority, :status]
    end
end
