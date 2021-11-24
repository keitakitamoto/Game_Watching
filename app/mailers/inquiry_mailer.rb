class InquiryMailer < ApplicationMailer
  def contact_mail(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: "Test from Rails")
  end
end