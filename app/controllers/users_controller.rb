class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :new, :create]
  before_action :set_roles_options, only: [:edit, :new, :create]

  caches_action :index, expires_in: 1.hour

  def index
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Created successfully!' }
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end


  def edit
    authorize @user
  end

  def update
    authorize @user

    if @user.update!(user_params)
      redirect_to root_path, notice: 'Updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    authorize @user

    @user.destroy!

    redirect_to root_path, notice: 'Deleted successfully!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_roles_options
    @roles = User.roles.keys.to_a
  end

  def user_params
    params.require(:user).permit(:name, :active, :role, :password, :email)
  end
end
