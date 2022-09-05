class ShipperEmailMailer < ApplicationMailer
    def shipper_email
        @sale = params[:sale]
        # @email = @sale.client.email
        @dir = params[:dir]
        @url  = 'http://example.com/login'
        mail(to: @email, subject: 'Orden confirmada')
      end
end
