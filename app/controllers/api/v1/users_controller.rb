        class Api::V1::UsersController < ApplicationController
            before_action :set_user, only: %i[ show edit update destroy ]
            
            
            def index
                @users = User.all
                
                respond_to do |format|
                    format.xml {render xml: @users}
                    format.json {render json: @users, status: 404}
                end
                
            end
            
            def show
                @user = User.find(params[:id])
                
                respond_to do |format|
                    format.xml {render xml: @user}
                    format.json {render json: @user, status: 404}
                end
            end
            
            
            def new
                @user = User.new
            end
            
            # GET /users/1/edit
            def edit
            end
            
            
            # POST /users or /users.json
            def create
                @user = User.new(user_params)
                
                respond_to do |format|
                    if @user.save
                        format.json { render json: @user, status: :created, location: @user }
                    else
                        format.json { render json: @user.errors, status: :unprocessable_entity }
                    end
                end
            end
            
            # PATCH/PUT /users/1 or /users/1.json
            def update
                respond_to do |format|
                    if @user.update(user_params)
                        format.json { render json: @user, status: :ok, location: @user }
                    else
                        format.json { render json: @user.errors, status: :unprocessable_entity }
                    end
                end
            end
            
            # DELETE /users/1 or /users/1.json
            def destroy
                @user.destroy
                
                respond_to do |format|
                    format.json { head :no_content }
                end
            end
            
            private
            # Use callbacks to share common setup or constraints between actions.
            def set_user
                @user = User.find(params[:id])
            end
            
            # Only allow a list of trusted parameters through.
            def user_params
                params.fetch(:user, {}).permit(:id, :email, :first_name, :last_name)
            end
        end
        