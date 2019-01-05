class EmployeesController < ApplicationController
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

	private
	
	def employee_params
		params.require(:employee).permit(:name, :email, :password)
	end
end
