class UserMailer < ActionMailer::Base
  default from: "info@honey-do-this.net"
  def invite(invite)
    @invitor = User.find(invite.user_id)
    @url = "https://honey-do-this.net"
    @invitee = invite.last_name
    mail(to: invite.email, subject: "Welcome to Honey Do This")
  end
  
  def contactus(contact)
    @contact = Contact.find(contact.id)
    mail(from: @contact.user.email, to: 'info@honey-do-this.net', subject: "Contact Us Email")
  end
  
end