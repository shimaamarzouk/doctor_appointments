# frozen_string_literal: true

require "dry/types"
require "bigdecimal"

module DoctorAppointments
  module Types
    include Dry.Types()

    UUID = Types::String
    Time = Types::Time
    String = Types::String
    Bool = Types::Bool
    Integer = Types::Integer
    Decimal = Types::Decimal
  end
end
