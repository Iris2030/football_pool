
class Api::V1::ApplicationApiController < ActionController::API
    include ActionController::MimeResponds
    require 'jwt'

    before_action :authorize_req
    skip_before_action :authorize_req, only: [:get_token]

        
    def get_token
        current_user = User.find_by(email: login_params[:email])
        # current_user.valid_password?(login_params[:password])
        if(current_user.valid_password?(login_params[:password])) 
        payload = {}
        iat = Time.now.to_i
        exp = Time.now.to_i + 300
        payload[:exp] = exp
        payload[:iat] = iat
        payload[:email] = current_user.email
        payload[:user_id] = current_user.id
        token = JWT.encode payload, Rails.application.credentials.hmac_secret, 'HS256'
        
        respond_to do |format|
            format.xml {render xml: token, status: 200}
            format.json {render json: {message:"token generated", token: token}, status: 200}
        end
    else
        respond_to do |format|
            # format.xml {render xml: token, status: 200}
            format.json {render json: {message:"The password is incorrect!"}, status: 404}
            # raise "Password is not correct"
        end
    end
    end
    
    
    def authorize_req
        header = request.headers['Authorization']
        header= header.split(' ').last if header
        puts header
        begin
            decoded_token = JWT.decode header, Rails.application.credentials.hmac_secret, true, { algorithm: 'HS256' }
            user_id = decoded_token[0]["user_id"] unless !decoded_token
            puts user_id
            
            user = User.find(user_id)
        rescue ActiveRecord::RecordNotFound => e
            render json: {errors: e.message}, status: 401
        rescue JWT::DecodeError => e
            render json: {errors: e.message}, status: 401
        rescue JWT::ExpiredSignature => e
            render json: {errors: e.message}, status: 401
            
        end
    end


    private 

    def login_params
        params.fetch(:user, {})
        # user = User.find_by_email(params[:user][:email])
        # user.valid_password?(params[:user][:password])
        
        # user = User.find_for_authentication(email: params[:user][:email])
        # user.valid_password?(params[:user][:password])
    end
    

end