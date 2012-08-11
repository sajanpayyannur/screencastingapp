module TransactionType

  def self.included(base)
    base.extend         ClassMethods
    base.class_eval do

    end
    base.send :include, InstanceMethods
  end # self.included

  module ClassMethods
    @@transaction_types = {"C" => "Credit", "D" => "Debit"}
    def transaction_types
      @@transaction_types
    end

    def transaction_type_description(transaction_code)
      @@transaction_types[transaction_code]
    end

    def credit
      "C"
    end

    def debit
      "D"
    end
  end # ClassMethods

  module InstanceMethods
    def is_credit?
      self.transaction_type == self.class.credit
    end

    def is_debit?
      self.transaction_type == self.class.debit
    end
  end # InstanceMethods

end
