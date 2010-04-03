# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :load_blog
  
  before_filter :create_user
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  private
  
  def create_user
    if AppEngine::Users.current_user.nil?
      @user = nil
    else
      @user = AppEngine::Users::User.new(AppEngine::Users.current_user.email)
    end
  end
  
  def load_blog
    @blog = Blog.first
    if @blog.nil?
      @blog = Blog.new :title => 'Rails Turbine', :description => 'A blog engine running on the Rails powered by the GAE', :author => 'non'
      if request.path != '/blogs/new' && !(request.path == '/blogs' && request.method == :post)
        redirect_to :controller => 'blogs', :action => 'new'
      end
    end
  end                                                                        
end
