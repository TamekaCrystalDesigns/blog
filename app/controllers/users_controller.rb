class UsersController <ApplicationController

	def index
		@users = User.all

		if @users.present?
			flash[:notice] = "Users exist!"
		else
			flash[:alert] = "Sorry, there were no users to display"
		end

	end

	def show
		@post = Post.find_by_id(params[:id])

		if @post.present?
			flash[:notice] = "Post exists"
		else
			flash[:alert] = "Sorry, there were no posts to display"
		end
	end

	def new
		@user = User.new
		@post = Post.new
	end

	def create

		@post = Post.new(post_params)
		@user = User.new(user_params)

		if @post.save
			flash[:notice] = "Post was successfully created"
			redirect_to users_path
		else
			render :new
		end
	end

	def destroy
		user = User.find(params[:id])
		if user.delete
			flash[:notice] = "User Deleted"
		else
			flash[:alert] = "Could not delete user"
		end

		return redirect_to(users_path)
	end

	def user_params
		params.require(:user).permit(:fname, :lname, :email)
	end
	def post_params
		params.require(:post).permit(:body)
	end
end