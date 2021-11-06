Grasses 2.0 

User
  - has_many :periods
  - has_many :students, through :periods
  - username
  - email
  - password_digest

Periods #instead of class 
  - belongs_to :user
  - has_many :students
  - has_many :assignments 
  - period_name

Students
  - belongs_to :user
  - has_many :assignments 
  - has_many :classes
  - student_name
  - grade_average

Assignments
  - belongs_to :students
  - belongs_to :Periods
  - assignment_name
  - grade

