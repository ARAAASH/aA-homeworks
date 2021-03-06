require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class QuestionFollow
  
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_follows
      WHERE id = ?
    SQL
    QuestionFollow.new(data.first)
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT users.id, users.fname, users.lname
      FROM question_follows
      JOIN users
      ON users.id = question_follows.user_id
      WHERE question_follows.question_id = ?
    SQL
    data.map {|datum| User.new(datum)}
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT questions.id, questions.title, questions.body, questions.author_id
      FROM question_follows
      JOIN questions
      ON question_follows.question_id = questions.id
      WHERE user_id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT questions.id, questions.title, questions.body, questions.author_id
      FROM question_follows
      JOIN questions 
      ON questions.id = question_follows.question_id
      GROUP BY question_id
      ORDER BY question_id DESC 
      LIMIT ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  

  attr_accessor :id, :user_id, :question_id
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end