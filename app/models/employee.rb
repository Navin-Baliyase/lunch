class Employee < ApplicationRecord
	has_secure_password
	has_one :place
end
