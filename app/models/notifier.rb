class Notifier < ActionMailer::Base
    
  def gmail_message
    subject    'a canned message with static text - to test ActionMailer'
    recipients 'agile.action.advisors@gmail.com'
    from       'agile.action.advisors@gmail.com'
    sent_on    Time.now
  end
  
  def contact(email_params)
    subject "[Carl's Website] " << email_params[:email] << ": " << email_params[:topic]
    body :message => email_params[:body], :name => email_params[:name]
    recipients 'agile.action.advisors@gmail.com'
      from email_params[:email]
    sent_on Time.now.utc 
  end
  
end
