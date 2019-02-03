require_relative "questions_database"
require_relative 'user'
require_relative 'question'

class QuestionLike
  
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_likes
      WHERE id = ?
    SQL
    QuestionLike.new(data.first)
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.id, users.fname, users.lname
      FROM question_likes
      JOIN users
      ON users.id = question_likes.user_id
      WHERE 
        question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT COUNT(*) AS count
      FROM question_likes
      WHERE question_id = ?
      GROUP BY question_id
    SQL
    data.first['count']
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.id, questions.title, questions.body, questions.author_id
      FROM question_likes
      JOIN questions
      ON question_likes.question_id = questions.id
      WHERE question_likes.user_id = ?
    SQL

    data.map { |datum| Question.new(datum) }
  end

  def most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT id, title, body, author_id
      FROM (
        SELECT questions.id, questions.title, questions.body, questions.author_id, COUNT(*) AS c
        FROM question_likes
        JOIN questions
        ON question_likes.question_id = questions.id
        GROUP BY question_likes.question_id
        ORDER BY c DESC
        LIMIT ?
      )
    SQL
    data.map { |datum| Question.new(datum) }
  end

  attr_accessor :id, :user_id, :question_id
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end