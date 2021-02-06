class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate ,except: [:index,:show,:new]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    if is_admin?
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      return head 404
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if is_admin?
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      return head 404
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if is_admin?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      return head 404
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
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
    def user_params
      params.require(:user).permit(:username, :password, :role_id, :age, :contact)
    end
end
