require 'pry'
require 'bank_account.rb'

class Transfer
    attr_accessor :sender, :receiver, :amount
    attr_reader :status

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
        # @accounts = []
        # @accounts << sender
        # @accounts << receiver
    end

    def valid?
        if sender.valid? == true && receiver.valid? == true
            true
        else
            false
        end
    end

    def execute_transaction
        if valid? == true && status != "complete" && sender.balance > amount
            sender.deposit(-amount)
            receiver.deposit(amount)
            @status = "complete"
        else
            @status = "rejected"
            "Transaction rejected. Please check your account balance."
        end
    end

    def reverse_transfer
        if status == "complete"
            sender.deposit(amount)
            receiver.deposit(-amount)
            @status = "reversed"

        end

    end




end
