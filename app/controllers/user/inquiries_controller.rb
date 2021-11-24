class User::InquiriesController < ApplicationController
  def new
    # 入力画面を表示
    @inquiry = Inquiry.new
  end

  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.invalid?
      # OK。確認画面を表示
      render :new
    end
  end

  def back
    @inquiry = Inquiry.new(inquiry_params)
    render :new
  end

  # 実際に送信するアクションになります。
  # ここで初めて入力内容を保存します。
  # セキュリティーのためにも一定時間で入力内容の削除を行ってもいいかもしれません。
  def create
    @inquiry = Inquiry.new(inquiry_params)
    # if @inquiry.valid?
    # InquiryMailer.contact_mail(@inquiry)
    if @inquiry.save!
      # InquiryMailer.with(inquiry: @inquiry).contact_mail.deliver_later
      InquiryMailer.contact_mail(@inquiry).deliver_now
      redirect_to user_inquiries_thanks_path
    end



    # else
    #   render :confirm
    # end
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

end
