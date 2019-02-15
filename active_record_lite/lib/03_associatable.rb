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
    if options.empty?
      @foreign_key = (name.to_s.camelcase + 'Id').underscore.to_sym
      @primary_key = :id
      @class_name = name.to_s.camelcase
    else
      @foreign_key = options[:foreign_key] unless options[:foreign_key].nil?
      @class_name = options[:class_name] unless options[:class_name].nil?
      @primary_key = options[:primary_key] unless options[:primary_key].nil?
    end

  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    if options.empty?
      @primary_key = :id
      @foreign_key = (self_class_name + 'Id').underscore.to_sym
      @class_name = name.singularize.camelcase
    else
      @primary_key = options[:primary_key] unless options[:primary_key].nil?
      @foreign_key = options[:foreign_key] unless options[:foreign_key].nil?
      @class_name = options[:class_name] unless options[:class_name].nil?
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
