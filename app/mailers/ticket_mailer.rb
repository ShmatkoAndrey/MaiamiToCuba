class TicketMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def pay_email(email, tickets)
    @tickets = tickets
    mail(to: email, subject: 'Tickets')
  end
end
