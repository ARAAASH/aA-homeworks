require_relative 'questions_database'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_like'

class User

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    User.new(data.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM users
      WHERE 
        fname = ? AND lname = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  attr_accessor :id, :fname, :lname
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT CAST(COUNT(question_id)/COUNT(DISTINCT(questions.id)) AS FLOAT) AS n
      FROM questions
      JOIN question_likes
      ON questions.id = question_likes.question_id
      WHERE author_id = ?
    SQL
    data.first['n']
  end

  def save
    if @id
      update
    else
      data = QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
        INSERT INTO users(fname, lname)
        VALUES (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end

  def update
    # raise "#{self} doesn't exist in db" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE 
        users
      SET 
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

end