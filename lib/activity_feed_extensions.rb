module Feed
  module Extensions
    
    include ActiveSupport::Concern
    
    module ClassMethods
      def feed_template(options)
        template_type = options.keys.first
        template_name = options[template_type]
        self.class_eval <<-EOC
          def self.#{template_type}_feed_template
            return "#{template_name}"
          end
        EOC
      end

    end


  end
end

ActiveRecord::Base.send(:include, Feed::Extensions)
ActiveRecord::Base.send(:extend, Feed::Extensions::ClassMethods)

