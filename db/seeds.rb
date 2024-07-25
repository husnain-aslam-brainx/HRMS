# db/seeds.rb

# Clear existing data
ActiveStorage::Attachment.delete_all
ActiveStorage::Blob.delete_all
Interview.delete_all
CandidatePositionTest.delete_all
Candidate.delete_all
Position.delete_all
Test.delete_all

# Create Users (assuming you have some users for testing purposes)
# Create Positions
positions = Position.create!([
  { description: "We are hiring for a rails developer.", title: 0, status: 0 },
  { description: "SQA position is available.", title: 1, status: 0 },
  { description: "Need react developer", title: 0, status: 0 },
  { description: "Need React team lead", title: 0, status: 0 }
])

# Create Tests
tests = [
  {
    description: "Ruby on Rails assessment",
    assessment_path: "/Users/brainxror/Training/HRMS/app/assets/pdfs/test.pdf"
  },
  {
    description: "Software Quality Assurance test",
    assessment_path: "/Users/brainxror/Training/HRMS/app/assets/pdfs/test.pdf"
  },
  {
    description: "React proficiency test",
    assessment_path: "/Users/brainxror/Training/HRMS/app/assets/pdfs/test.pdf"
  }
]

tests.each_with_index do |test_data, index|
  test = Test.create!(description: test_data[:description])

  test.assessment.attach(
    io: File.open(test_data[:assessment_path]),
    filename: "assessment#{index + 1}.pdf",
    content_type: "application/pdf"
  )
end

# Create Candidates with Active Storage attachments
candidates = [
  {
    name: "Husnain Aslam",
    email: "husnain@gmail.com",
    profile_path: "/Users/brainxror/Training/HRMS/app/assets/images/profile1.jpg",
    resume_path: "/Users/brainxror/Training/HRMS/app/assets/pdfs/resume.pdf",
    address: "Lahore",
    phone: "9292929299292"
  },
  {
    name: "John Doe",
    email: "john.doe@example.com",
    profile_path: "/Users/brainxror/Training/HRMS/app/assets/images/profile2.jpg",
    resume_path: "/Users/brainxror/Training/HRMS/app/assets/pdfs/resume.pdf",
    address: "New York",
    phone: "1234567890"
  }
]

candidates.each_with_index do |candidate_data, index|
  candidate = Candidate.create!(
    name: candidate_data[:name],
    email: candidate_data[:email],
    address: candidate_data[:address],
    phone: candidate_data[:phone]
  )

  candidate.profile.attach(
    io: File.open(candidate_data[:profile_path]),
    filename: "profile#{index + 1}.jpg",
    content_type: "image/jpg"
  )

  candidate.resumes.attach(
    io: File.open(candidate_data[:resume_path]),
    filename: "resume#{index + 1}.pdf",
    content_type: "application/pdf"
  )
end

# CandidatePositionTest.create!({candidate: Candidate.first, test_id: Test.first, position_id: Position.first})

# Create Candidate Position Tests
CandidatePositionTest.create!([
  { candidate: Candidate.first, test: Test.first, position: Position.first, status: 0, result: 0 },
  { candidate: Candidate.second, test: Test.second, position: Position.first ,status: 1, result: 1 },
  { candidate: Candidate.first, test: Test.second, position: Position.first, status: 1, result: 1 },
  { candidate: Candidate.second, test: Test.second, position: Position.first, status: 1, result: 0 }
])

# Create interviews
Interview.create!([
  { interview_type: 0, candidate_position_test: CandidatePositionTest.first, interviewer: "Ali" , result: 0},
  { interview_type: 1, candidate_position_test: CandidatePositionTest.second, interviewer: "Ahmad" , result: 0},

])

puts "Seeding completed successfully!"
