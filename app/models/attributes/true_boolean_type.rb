module Attributes
  class TrueBooleanType < ActiveRecord::Type::Value
    TRUE_VALUES = [true, 1, "1", "t", "T", "true", "TRUE", "on", "ON", "yes", "y"].to_set

    def type
      :boolean
    end

    def cast(value)
      TRUE_VALUES.include?(value)
    end
  end
end
