class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.order("name")
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
