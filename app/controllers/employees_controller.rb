class EmployeesController < ApplicationController
	protect_from_forgery
	before_action :verify_login, only: [:show, :update, :destroy, :index, :update_password]

	def home
	end

	def verify_login
		if !current_user
			if params[:employee] && params[:employee][:email] && params[:employee][:password]
				@employee = Employee.authenticate(params[:employee][:email], params[:employee][:password])
			end
			if @employee
				session[:employee_id] = @employee.id
				redirect_to employees_url, :notice => "Logged in!"
			else
				flash.now.alert = "Invalid email or password" if params[:employee]
				render "verify_login"
			end
		end
	end

	def destroy_login
		session[:employee_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

	def index
		@employee = EmployeeMember.all
	end

	def show
		@employee = EmployeeMember.find(params[:id])
	end

	def new
		@employee = EmployeeMember.new
	end

	def create
		@employee = EmployeeMember.new(employee_params)
		if @employee.save
			NotificationMailer.notification_mailer(@employee).deliver
			redirect_to employees_path, :notice => 'Reset password mail successfully created.'
		else
			flash.now.alert = "Email Already Taken"
			render 'new'
		end
	end

	def update_password
		@employee.update_attributes(params[:employee][:password]) if params[:employee] && params[:employee][:password]
		redirect_to root_url, :notice => 'password reset sucessfully'
	end

	def reset_password
		@employee = EmployeeMember.where(id: params[:value]) if params[:value]
		if !@employee.blank?
			render 'update_password'
			#@employee.update_attributes(params[:password]) if params[:password]
			#redirect_to root_url, :notice => 'password reset sucessfully'
		else
			flash.now.alert = "You are not authorised to perform the action"
		end
	end

	def user_place
		if params[:place] && params[:place][:proposed_place]
			@place = Place.new(place_params)
			if @place.save
				flash.now.alert = "Thanks for your Suggestion"
				redirect_to employees_path
			else
				flash.now.alert = "Something went wrong"
				redirect_to root_url
			end
		end
	end

	def finalize
		employee = EmployeeMember.find(params[:employee_id])
		if employee
			@employee_name = employee.name
			@employee_email = employee.email
			@employee_suggestion = employee.place.proposed_place
			NotificationMailer.finalize_mailer(@employee_name,@employee_email,@employee_suggestion).deliver
			flash.now.alert = 'Request email sent to all employees'
		end
	end


	private
	
	def employee_params
		params.require(:employee).permit(:name, :email, :password)
	end

	def place_params
		params.require(:place).permit(:employee_id, :proposed_place)
	end

end
