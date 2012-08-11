module TransactionStatus
  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do

    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods
    @@transaction_statuses = {"P" => "Pending", "C" => "Canceled", "E" => "Effected"}
    def transaction_statuses
      @@transaction_statuses
    end

    def transaction_status_description(status_code)
      @@transaction_statuses[status_code]
    end

    def pending
      "P"
    end

    def canceled
      "C"
    end

    def effected
      "E"
    end
  end # ClassMethods

  module InstanceMethods
    def is_canceled?
      self.transaction_status == self.class.canceled
    end
    def is_effected?
      self.transaction_status == self.class.effected
    end
    def is_pending?
      self.transaction_status == self.class.pending
    end
  end # InstanceMethods
end
