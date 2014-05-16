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

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    
   params[:goal][:owner_id] = current_subject.try(:actor_id)
   params[:goal][:author_id] = current_subject.try(:actor_id)
   params[:goal][:user_author_id] = current_user.try(:actor_id)

   @goal = Goal.new(permitted_params)
  
    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
     # if @goal.update_attributes(goal_params)
     if @goal.update_attributes(permitted_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
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
      params.require(:goal).permit(:date, :description, :name, :priority, :status, :owner_id, :author_id, :user_author_id)
    end
    
    def allowed_params
      [:date, :description, :name, :priority, :status, :activity_object]
    end
end
