require 'rails_helper'

RSpec.describe Employee, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:each)do
    @employee = Employee.delete_all
  end

  it "should create an Employee" do
  	emp = Employee.create!(email: "navin@kreatio.com", password: "navin123")
    expect(emp.email).to eq "navin@kreatio.com"
  end

  it "should not create a employee if email is not present" do
    expect {Employee.create!(email: "", password: "navin123")}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should not create a employee if email is already taken" do
    emp = Employee.create!(email: "navin@kreatio.com", password: "navin123")
    emp1 = {email: "navin@kreatio.com", password: "navin123"}
    expect {Employee.create!(emp1)}.to raise_error ActiveRecord::RecordInvalid
  end

end
