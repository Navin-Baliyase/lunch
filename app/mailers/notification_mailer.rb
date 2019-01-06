class NotificationMailer < ApplicationMailer
  default from: 'info@lunch.com'
  def notification_mailer(employee)
    @employee = employee
    mail(to: @employee.email,:subject => "New Notification")
  end

  def finalize_mailer(employee_name,employee_email,employee_suggestion)
  	@employee_name = employee_name
  	@employee_email = employee_email
  	@employee_suggestion = employee_suggestion
  	mail(to: @employee_email,:subject => "Ready for Party!")
  end
end
