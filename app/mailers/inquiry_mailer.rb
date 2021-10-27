class InquiryMailer < ApplicationMailer
  default from: "example@example.com"   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail to: ENV['TOMAIL'], subject: '【お問い合わせ】'+ @inquiry.subject_i18n
  end
end