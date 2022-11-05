class UserMailer < ApplicationMailer
        def greeting_email
          @user = params[:user]
          mail(to: @user.email, subject: "Greeting mail!", from: "ibazhinova@gmail.com")

        end
        
end
