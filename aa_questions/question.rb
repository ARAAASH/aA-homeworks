require_relative 'questions_database'

class Question


  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    Question.new(data.first)
    # data
  end

  attr_accessor :id, :title, :body, :author_id
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def create
    raise "#{self} is already in the table" if @id
    QuestionsDatabase.instance.execute(<<-SQL, title, body, author_id)
      INSERT INTO
        questions(title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end
end