class Transfer
  attr_accessor :sender, :receiver, :status

  def initialize(sender, reciever)
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end
end
