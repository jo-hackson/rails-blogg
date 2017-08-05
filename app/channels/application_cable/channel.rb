module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
end

# logical unit of work
# like a controller in MVC
# by default, Rails creates parent ApplicationCable::Channel for shared login between channels
