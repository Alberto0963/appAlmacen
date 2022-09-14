class OrderSendMailer < ApplicationMailer
    def order_send_email
        @sale = params[:sale]
        @email = @sale.client.email
        @dir = params[:dir]
        @url  = 'http://example.com/login'
        mail(to: @email, subject: 'Confirmación de Orden')
      end
end
