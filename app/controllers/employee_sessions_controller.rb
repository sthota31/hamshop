class EmployeeSessionsController < ApplicationController
  before_filter :locations

  def new
  end

  def create
  	if params[:employee_session][:username].present?
		sql = "CONCAT(first_name ,' ', last_name) = '#{params[:employee_session][:username]}'" 
  		employee = Employee.where(sql).first
  		
  		if employee 
     		session[:emp_id] = employee.id 
     		session[:location_id] = params[:employee_session][:location_id] 
     		redirect_to employees_path, notice: "Logged in!"

  		end
  	else
     	flash[:error] = 'Enter Username as full name Ex: Alexandra Shook ' # Not quite right!
      	render 'new'
  	end
  end

  def destroy
    session[:emp_id] = nil
    session[:location_id] = nil
    redirect_to new_employee_session_url, notice: "Logged out!"
  end

  private
  def locations
  	@locations = Location.all
  end 
end
