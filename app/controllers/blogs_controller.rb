class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  before_action :authenticate ,except: [:index,:show]
  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new

    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    if is_writer?
      @blog = Blog.new(blog_params)

      respond_to do |format|
        if @blog.save
          format.html { redirect_to @blog, notice: "Blog was successfully created." }
          format.json { render :show, status: :created, location: @blog }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end

    else
      return head 404
      end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    current_member = User.find_by(id: session[:user_id])
    if is_writer? && current_member.user_id == blog.user_id || is_admin?
      respond_to do |format|
        if @blog.update(blog_params)
          format.html { redirect_to @blog, notice: "Blog was successfully updated." }
          format.json { render :show, status: :ok, location: @blog }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end

    else
      return head 404
  end

  # DELETE /blogs/1 or /blogs/1.json
  #Either admin can delete the blog or blogs's writer can do.
  def destroy
    current_member = User.find_by(id: session[:user_id])
    if is_writer? && current_member.user_id == blog.user_id || is_admin?
      @blog.destroy
      respond_to do |format|
        format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
        format.json { head :no_content }
      end
    
    else
      return head 404
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end 

    def is_writer?
      current_member = User.find_by(id: session[:user_id])
      if current_member.role.userrole == 'writer' 
        return true 
      else
        return false
      end
    end

     def is_admin?
      current_member = User.find_by(id: session[:user_id])
      if current_member.role.userrole == 'admin' 
        return true 
      else
        return false
      end
    end
    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :readtime, :category_id, :user_id,:content)
    end
end
