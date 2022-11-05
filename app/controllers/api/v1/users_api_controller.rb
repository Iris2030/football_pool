
        class Auth::V1::UsersApiController < ApplicationController
            def index
                @users = User.all

                respond_to do |format|
                    format.xml {render xml: @users}
                    format.json {render json: @users, status: 404}
                        end

            end
        end
