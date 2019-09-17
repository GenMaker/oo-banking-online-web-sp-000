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
    if sender.status == "closed"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if  @status =="pending"
      if sender.valid? == true
        sender.deposit(@amount * -1)
        receiver.deposit(@amount)
        @status = "complete"
      end
    end
  end

end
