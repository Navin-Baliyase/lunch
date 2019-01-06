class Employee < ApplicationRecord
	has_secure_password
	has_one :place
	validates_presence_of :email
    validates_uniqueness_of :email


  def self.authenticate(email, password)
	employee = Employee.find_by(email: email).try(:authenticate, password)
    if employee
      employee
    else
      nil
    end
  end


end
