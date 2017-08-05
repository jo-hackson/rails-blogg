# from docs
# app/channels/application_cable/connection.rb
# assumes already handled authentication of user somewhere else in app and sets a signed cookie with userID
# cookie is then auto sent to connection instance when a new connection is attempted and you set the current_user
# by id-ing connection by this same curent user, ensuring that you can later retrieve all open connections by a given user (and disconnect if user is deleted or unauthorized)

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        if verified_user = User.find_by(id: cookies.signed[:user_id])
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end

# foundation of client-server relationship
# for every WebSocket accepted by server, a connection object is instantiated
# object becomes parent of all channel subscriptions
# connection does not deal with any specific app logic beyond authentication and authorization
# client of WebSocket connection is called the connection consumer
# individual user will create one consumer-connection pair per browser tab, window, or device

# connections are instances of ApplicationCable::Connection
# in this class, authorize the incoming connection, proceed to establish it if the user can be identified
