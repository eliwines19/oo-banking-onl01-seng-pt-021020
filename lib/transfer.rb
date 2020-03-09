class Transfer
  attr_accessor :sender, :receiver, :status

  def initialize(sender, reciever, status)
    @sender = sender
    @receiver = receiver 
  end
end
