module Dry
  class Transaction
    class StepAdapters
      # @api private
      class Tee
        include Dry::Monads::Either::Mixin

        def call(step, input, *args)
          step.operation.call(input, *args)
          Right(input)
        end
      end

      register :tee, Tee.new
    end
  end
end
