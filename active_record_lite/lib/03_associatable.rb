require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      primary_key: :id,
      foreign_key: "#{name}_id".to_sym,
      class_name: name.to_s.camelcase
    }

    defaults.keys.each do |k|
      self.send("#{k}=", options[k] || defaults[k])
    end

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      primary_key: :id,
      foreign_key: "#{self_class_name}Id".underscore.to_sym,
      class_name: name.to_s.singularize.camelcase
    }

    defaults.keys.each do |k|
      self.send("#{k}=", options[k] || defaults[k])
    end

  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      foreign_key_val = self.send(options.foreign_key)
      options.model_class.where({options.primary_key => foreign_key_val}).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.name, options)
    define_method(name) do
      primary_key_val = self.send(options.primary_key)
      options.model_class.where(options.foreign_key => primary_key_val)
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
