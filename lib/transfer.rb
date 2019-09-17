require "pry"

class Transfer
  attr_reader  :receiver, :transfer
  attr_accessor :sender, :status, :amount

  def initialize (sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if  @status =="pending" && sender.balance > amount
      if sender.valid? == true
        sender.deposit(@amount * -1)
        receiver.deposit(@amount)
        @status = "complete"
      end
    end
    if valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
