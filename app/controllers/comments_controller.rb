class CommentsController < ApplicationController
  before_filter :load_post
  def create
    @comment = @post.comments.create(params[:comment])
    c = Captcha.new

    if params['catpcha_text'].strip == c.decrypt(params['random']).strip
      if @comment.save
        flash[:notice] = "comment successfully created"
        redirect_to :back
      end
    else
      flash[:notice] = "capta not correct"
      redirect_to :back
    end
  end
  
  private
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
