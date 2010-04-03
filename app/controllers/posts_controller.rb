require 'appengine-apis/datastore'

class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    
    @old_post = AppEngine::Datastore::Query.new('Post').filter('title', AppEngine::Datastore::Query::EQUAL, 'About Me')
    
    
    if params[:pending_publish] == 'true'
      puts "finding all unpublished articles"
      #verify_admin_user()   
      @posts = Post.all(:is_published.not => true)
    else
      puts "finding all published articles"
      @posts = Post.all(:is_published => true, :order => [:created_at.desc])
    end
    #@posts = nil
    respond_to do |format|
    
      format.html do
      end

      format.rss do
        puts "rendering RSS"
        #render :layout => false
      end

    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    
    @random = Captcha.random
    
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    @post.markup_lang= 'MARKDOWN'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @post.blog= @blog
    
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
