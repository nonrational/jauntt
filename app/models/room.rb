class Room < ActiveRecord::Base

  def build_message(opts = {})
    Message.new opts.merge(room: self)
  end
end
