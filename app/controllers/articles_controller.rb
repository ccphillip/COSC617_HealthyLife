class ArticlesController < ApplicationController
  include SocialStream::Controllers::Objects
  before_filter :index
  
   def index
     
    @articles = Article.find_all_by_user_id(current_user.id)
     @activities =
      Activity.find_all_by_author_id(current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end
   

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def article_params
      params.require(:article).permit(:article_type, :body, :subject,:user_id)
    end
    def allowed_params
    [:article_type, :body, :subject,:user_id]
  end
   
end
