class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  #initializes with a sender, receiver, transfer amount, and status of pending

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  #checks that both sender and reciever accounts are valid

  def execute_transaction
    if @sender.balance < @amount || !valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "This transaction has already been processed."
    else
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end
  #executes a successful transaction between two accounts
  #each transfer can only happen once
  #rejects a transfer if the sender doesnt have enough funds or a valid account

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end
  #can revers a transfer between two accounts
  #can only revers executed transfers 

end
