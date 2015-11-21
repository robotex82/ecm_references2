require 'shoulda/matchers/active_model/validation_matcher.rb'

module Shoulda # :nodoc:
  module Matchers
    module ActiveModel # :nodoc:

      # Ensures that the model is not valid if the given attribute is present.
      #
      # Options:
      # * <tt>with_message</tt> - value the test expects to find in
      # <tt>errors.on(:attribute)</tt>. <tt>Regexp</tt> or <tt>String</tt>.
      # Defaults to the translation for <tt>:blank</tt>.
      #
      # Examples:
      # it { should validate_absence_of(:name) }
      # it { should validate_absence_of(:name).
      # with_message(/is not allowed/) }
      #
      def validate_absence_of(attr)
        ValidateAbsenceOfMatcher.new(attr)
      end

      class ValidateAbsenceOfMatcher < ValidationMatcher # :nodoc:

        def with_message(message)
          @expected_message = message if message
          self
        end

        def matches?(subject)
          super(subject)
          @expected_message ||= :absence
          disallows_value_of(non_blank_value, @expected_message)
        end

        def description
          "require #{@attribute} to be empty"
        end

        private

        def non_blank_value
          if collection?
            [ :foo ]
          else
            'foo'
          end
        end

        def collection?
          if reflection
            [:has_many, :has_and_belongs_to_many].include?(reflection.macro)
          else
            false
          end
        end

        def reflection
          @subject.class.respond_to?(:reflect_on_association) &&
            @subject.class.reflect_on_association(@attribute)
        end
      end
    end
  end
end
