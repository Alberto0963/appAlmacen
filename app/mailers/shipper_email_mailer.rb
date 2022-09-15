class ShipperEmailMailer < ApplicationMailer
    def shipper_email
        @sale = params[:sale]
        @email = @sale.client.email
        @client = @sale.client.name
        @dir = params[:dir]
        @url  = 'http://example.com'
        mail(to: @email, subject: 'Orden confirmada')
      end
end
