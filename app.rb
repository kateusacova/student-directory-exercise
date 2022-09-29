require_relative './lib/cohort_repository'
require_relative './lib/database_connection'

class Application

  def initialize(database_name, io, cohort_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @cohort_repository = cohort_repository
  end

  def run
    cohort = @cohort_repository.find_with_students(2)
    puts cohort.name
    puts cohort.starting_date
    cohort.students.each { |student|
      puts "#{student.id} - #{student.name}"
    }
  end
end

if __FILE__ == $0
  app = Application.new(
    'student_directory_2',
    Kernel,
    CohortRepository.new
  )
  app.run
end