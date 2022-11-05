# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def greeting_email
    UserMailer.with(user: User.first).greeting_email
    end
end
