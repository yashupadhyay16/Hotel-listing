
json.resumes @resumes do |resume|
    json.id resume.id
    json.lname resume.laname
    json.fname resume.fname
    json.email resume.email
    json.file_path resume.avatar_path
end