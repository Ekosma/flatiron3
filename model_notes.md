Grasses 2.0 

Users
  - has_many :periods
  - has_many :students, through :periods
  - has_many :assignments, through :periods
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

Students_Periods #Join Table
  - belongs_to :students
  - belongs_to :period

Assignments
  - belongs_to :students
  - belongs_to :periods
  - assignment_name
  - grade


