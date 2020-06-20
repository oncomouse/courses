# frozen_string_literal:true

def write_markdown(file, year)
  dir = "./#{year}"
  if not Dir.exist? dir
    Dir.mkdir dir
  end
  File.write("#{dir}/#{file}.md", %(---
layout: syllabus
title: "Course Title"
---

# Schedule

{% include schedule.html schedule="#{file}" %}
))
end

def write_yaml(file)
  return if File.exist? "_data/#{file}.yml"

  File.write("_data/#{file}.yml", %(---
title: "Course Title"
start: 2020-08-19
end: 2020-11-24
holidays:
- date: 2020-11-25
  name: Reading Day
meets:
- monday
- wednesday
- friday
units:
- title: First Unit
  start: 1
weeks:
"1": First Week
classes:
- |
  * First Class
))
end

task :course do
  (ARGV[1..]).each do |file|
    task file.to_sym do; end
    year = file[-4..]
    write_markdown(file, year)
    write_yaml(file)
  end
end

task :delete_course do
  (ARGV[1..]).each do |course|
    task course.to_sym do; end
    year = course[-4..]
    FileUtils.rm "_data/#{course}.yml" if File.exist? "_data/#{course}.yml"
    FileUtils.rm "#{year}/#{course}.md" if File.exist? "#{year}/#{course}.md"
  end
end
