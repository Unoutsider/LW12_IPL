module UsersHelper
	def validate_input
		@user = User.new(params.permit(:email, :login, :password, :password_confirmation))
		unless @user.valid?
			flash[:warning] = @user.errors.full_messages.to_sentence
		else
			flash[:success] = 'User has been created successfully!'
		end
	end
end
