module Formtastic
  module Inputs
    module Base
      module Stringish
        
        # @abstract Override this method in your input class to describe how the input should render itself.
        def to_html
          input_wrapping do
            label_html <<
            builder.text_field(method, input_html_options)
          end
        end
        
        # Overrides standard `input_html_options` to provide a `maxlength` and `size` attribute.
        def input_html_options
          {
            :maxlength => options[:input_html].try(:[], :maxlength) || limit,
            :size => builder.default_text_field_size,
            :placeholder => placeholder_text
          }.merge(super)
        end
        
        def placeholder_text
          localized_string(method, options[:placeholder], :placeholder)
        end
        
      end
    end
  end
end