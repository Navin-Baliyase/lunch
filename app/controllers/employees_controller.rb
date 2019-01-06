class EmployeesController < ApplicationController
	before_action :verify_login, only: [:show, :update, :destroy]

	def home

	end

	def verify_login
		if !@current_user
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
		else
			redirect_to root_url
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
		if @employee.save!
			redirect_to employees_path
		else
			render 'new'
		end
	end

	def User_place
		@employee = EmployeeMember.new(employee_params)
		if @employee.save!
			@place = Place.new(place_params)
			redirect_to employees_path
		else
			render 'index'
		end

	end

	private
	
	def employee_params
		params.require(:employee).permit(:name, :email, :password)
	end

	def place_params
		params.require(:place).permit(:proposed_place, employee_id: @employee.id)
	end
end
