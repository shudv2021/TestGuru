class FeedbackMailer < ApplicationMailer
  def send_report(current_user, report)
    @author = current_user.email
    @report = report
    mail to: Admin.first.email, subject: "This message from #{@author}"
  end
end

