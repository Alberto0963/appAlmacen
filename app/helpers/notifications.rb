class Notifications
    def sendnotification (tokens)
        fcm = FCM.new("AAAA5VkQXNc:APA91bFnpb6RPA6aIITXOZzVyGYfotrljZfIZQ4swWJ0stesHzxN44veoqCbGFifbzIuZVs3d6-PZVD95lAB2cBR2sgzDzhkTDW3-ZXD_OdGVPPsTZ3uEYvLYDVvFoQcQIQJ4OSn0v9R")

        # registration_ids= [token] # an array of one or more client registration tokens
        
        # See https://firebase.google.com/docs/cloud-messaging/http-server-ref for all available options.
        options = { "notification": {
                      "title": "Portugal vs. Denmark",
                      "body": "5 to 1"
                  }
        }

        token.each do |n|
            response = fcm.send(tokens[n].token, options)

        end
        response = fcm.send(registration_ids, options)
        render json: {data: response}, status: :ok


    end
end