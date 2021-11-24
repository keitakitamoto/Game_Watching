# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
  def contact_mail(contact)
    # mail(to: ENV['TOMAIL'], subject: "Test from Rails")
    print(333333333)
    InquiryMailer.with(inquiry: Inquiry.last).contact_mail
  end
end
