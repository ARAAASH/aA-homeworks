require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    return @columns if @columns
    record = DBConnection.execute2(<<-SQL).first
      SELECT *
      FROM "#{self.table_name}"
      LIMIT 0
    SQL
    @columns = record.map!(&:to_sym)
  end

  def self.finalize!

    self.columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end
      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end
    end

  end

  def self.table_name=(table_name)
    @everythingisanobject ||= table_name

  end

  def self.table_name

    if @everythingisanobject.nil?
      @everythingisanobject = self.name.tableize
    end
    @everythingisanobject
  end

  def self.all
    array_all = DBConnection.execute(<<-SQL)
      SELECT *
      FROM "#{self.table_name}"
    SQL
    self.parse_all(array_all)
  end

  def self.parse_all(results)
    res = []
    results.each do |prams|
      res << self.new(prams)
    end
    res
  end

  def self.find(id)
    record = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM "#{self.table_name}"
      WHERE id = ?
    SQL
    return nil if record.empty?
    self.new(record.first)
  end

  def initialize(params = {})
    params.each do |k,v|
      if self.class.columns.include?(k.to_sym)
        self.send("#{k}=", v)
      else
        raise "unknown attribute '#{k}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.join(', ')
    question_marks = (['?']*columns.count).join(', ')

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.send("id=", DBConnection.last_insert_row_id)

  end

  def update
    id = attribute_values.first
    set_line = self.class.columns.drop(1).map { |attr| "#{attr} = ?" }
    set_line = set_line.join(', ')
    DBConnection.execute(<<-SQL, *attribute_values.drop(1), id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
