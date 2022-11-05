
        class Auth::V1::UsersApiController < ApplicationController
            def index
                @games = Game.all

                respond_to do |format|
                    format.xml {render xml: @games}
                    format.json {render json: @games, status: 404}
                        end

            end
        end
