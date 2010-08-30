module HasProperties
  module SingletonMethods
    def has_properties(options = {})
      default_options = { :in => :data }
      options = default_options.merge(options)

      cattr_accessor :property_field
      self.property_field = options[:in]

      serialize self.property_field, Hash

      extend  ClassMethods
      include InstanceMethods
    end
  end

  module ClassMethods
    def property(name, type, options = {})
      define_method name do
        convert_property(property_hash[name.to_s], type, options)
      end

      define_method "#{name}=" do |value|
        property_hash[name.to_s] = convert_property(value, type)
      end
    end
  end

  module InstanceMethods
    def property_hash
      send("#{self.class.property_field}=", {}) unless send(self.class.property_field)
      send(self.class.property_field)
    end

    def convert_property(value, type, options = {})
      value = evaluate_property_default(options[:default]) if value.nil? && options[:default]
      
      case type.to_sym
      when :string
        value.to_s
      when :integer
        value.to_i
      end
    end
    
    def evaluate_property_default(default)
      case default
      when Proc
        default.bind(self).call
      else
        default
      end
    end
  end

  def self.included(receiver)
    receiver.extend         SingletonMethods
    receiver.send :include, InstanceMethods
  end
end

ActiveRecord::Base.send :include, HasProperties
