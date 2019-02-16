require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 03_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do
      # self is the instance of the class that wants to
      # use has_one_through

      # through_options are inside self, because always the through
      # association is defined in self class before has_one_through
      through_options = self.class.assoc_options[through_name]

      # class-name in through association is always the source class
      source_options = through_options.model_class.assoc_options[source_name]

      through_table = through_options.table_name
      through_pk = through_options.primary_key
      through_fk = through_options.foreign_key

      source_table = source_options.table_name
      source_pk = source_options.primary_key
      source_fk = source_options.foreign_key

      val = self.send(through_fk)

      records = DBConnection.execute(<<-SQL, val)
        SELECT #{source_table}.*
        FROM #{through_table}
        JOIN #{source_table}
        ON
          #{through_table}.#{source_fk} = #{source_table}.#{source_pk}
        WHERE
          #{source_table}.#{source_pk} = ?
      SQL

      source_options.model_class.parse_all(records).first
    end
  end
end
