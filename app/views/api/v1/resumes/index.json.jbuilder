json.resumes @resumes do |resume|
    json.id resume.id
    json.fname resume.fname
    json.lname resume.lname
    json.email resume.email
    json.contact resume.contact
    json.experience resume.experience
    json.role resume.role
    json.resume resume.avatar_path
end
