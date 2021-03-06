# Teacher.create!([
#   {first_name: "Miss", last_name: "Honey", email: "misshoney96@gmail.com", password: "password", password_confirmation: "password", type: "Teacher"},
#   {first_name: "Walter", last_name: "White", email: "theonewhoknocks@gmail.com", password: "password", password_confirmation: "password", type: "Teacher"},
  # {first_name: "George", last_name: "Feeny", email: "mrfeeny@aol.com", password: "password", password_confirmation: "password", type: "Teacher"}
# ])
Course.create!([
  {course_name: "Chemistry", teacher_id: 3},
  {course_name: "History", teacher_id: 2},
  {course_name: "Algebra", teacher_id: 1}
])
Student.create!([
  {first_name: "Billy", last_name: "Madison", email: "ttttodayjunior@gmail.com", password: "password", password_confirmation: "password", type: "Student"},
  {first_name: "Harry", last_name: "Potter", email: "gryffindor4eva@gmail.com", password: "password", password_confirmation: "password", type: "Student"},
  {first_name: "Cady", last_name: "Heron", email: "grool103@gmail.com", password: "password", password_confirmation: "password", type: "Student"},
  {first_name: "Cory", last_name: "Matthews", email: "brillohead@hotmail.com", password: "password", password_confirmation: "password", type: "Student"},
  {first_name: "Topanga", last_name: "Lawrence", email: "mrsmatthews@gmail.com", password: "password", password_confirmation: "password", type: "Student"}
])
Participation.create!([
  {course_id: 1, student_id: 5},
  {course_id: 1, student_id: 4},
  {course_id: 1, student_id: 6},
  {course_id: 2, student_id: 4}
])
HelpRequest.create!([
  {participation_id: 1, completed_time: "2019-10-28 20:18:49"},
  {participation_id: 3, completed_time: "2019-11-01 22:36:08"}
])
