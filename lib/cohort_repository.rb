require_relative "../lib/database_connection.rb"
require_relative "../lib/cohort.rb"
require_relative "../lib/student.rb"

class CohortRepository

  def find_with_students(id)
    query = "SELECT cohorts.id,
    cohorts.name,
    cohorts.starting_date,
    students.id AS student_id,
    students.name AS student_name
      FROM cohorts
        JOIN students
        ON students.cohort_id = cohorts.id
      WHERE cohort_id = $1;"
    params = [id]
    result = DatabaseConnection.exec_params(query, params)
    
    cohort = record_to_cohort(result[0])

    result.each { |record| 
      cohort.students << record_to_student(record)
    }

    cohort
  end

  private

  def record_to_cohort(record)
    cohort = Cohort.new
    cohort.id = record["id"]
    cohort.name = record["name"]
    cohort.starting_date = record["starting_date"]

    cohort
  end

  def record_to_student(record)
    student = Student.new
    student.id = record["student_id"]
    student.name = record["student_name"]
    
    student
  end
end