require_relative "../lib/cohort_repository.rb"

def reset_tables
  seed_sql = File.read('spec/student_dir_seeds.sql')
  connection = PG.connect({ host: ENV['HOST'], dbname: 'student_directory_2_test', user: 'postgres', password: ENV['PASSWORD'] })
  connection.exec(seed_sql)
end

RSpec.describe CohortRepository do
  before(:each) do
    reset_tables
  end

  it "Returns a single Cohort object with an array of Student objects" do
    repo = CohortRepository.new
    cohort = repo.find_with_students(1)
    expect(cohort.students.length).to eq 1
    expect(cohort.name).to eq "January"
  end
end