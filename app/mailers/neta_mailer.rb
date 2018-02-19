class NetaMailer < ApplicationMailer
  def neta_mail(account)
   @account = account
   user_info = User.find(@account.id)
   user_email = user_info.email

   mail to: user_email, subject: "アカウント登録完了メール"
  end
end
