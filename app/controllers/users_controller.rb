class UsersController < ApplicationController
  before_action :set_user, only: [:show, :show_whiskeys, :update, :destroy]
  before_action :authenticate_token, except: [:login, :show_whiskeys, :create]
  before_action :authorize_user, except: [:login, :show_whiskeys, :create, :index]
  
  # Login for users
  def login        
    user = User.find_by(username: params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        token = create_token(user.id, user.username)
        render json: { status: 200, token: token, user:user }
      else
        render json: {status: 401, message: 'Unauthorized' }
      end
    end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: get_current_user.to_json(include :whiskeys, :id) 
  end

  def show_whiskeys
    render json: User.find(params[:id]).to_json(include: :whiskeys)
  end
  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
      {
        exp: (Time.now + 30.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        user: {
          id: id,
          username: username
        }
      }
    end
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :password_digest)
    end
end
