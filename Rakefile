# frozen_string_literal:true

def file_parts(file)
  data = /([a-zA-Z]+)([0-9]{3})([A-Za-z]+)([0-9]{4})/.match(file)
  data.nil? ? ['_', 'engl', '123', 'fall', '2020'] : data
end

def write_markdown(file, year)
  dir = "./#{year}"
  Dir.mkdir dir unless Dir.exist? dir

  File.write("#{dir}/#{file}.md", %(---
layout: syllabus
title: Syllabus
---

# Schedule

{% include schedule.html %}

{% include policies.md %}
))
end

def write_yaml(file)
  return if File.exist? "_data/#{file}.yml"

  course = file_parts(file)

  File.write("_data/#{file}.yml", %(---
term: #{course[3].capitalize} #{course[4]}
number: #{course[1].upcase} #{course[2]}
title: "Course Title"
description: |
  This is a course
outcomes:
  - To finish the course
meetings:
  - location: LAAH 123
    time: MWF 10-12
instructors:
  - name: Andrew Pilsch
    email: apilsch@tamu.edu
    office:
      - hours: MWF 1-2
        location: LAAH 417
start: #{course[4]}-08-19
end: #{course[4]}-11-24
holidays:
  - date: #{course[4]}-11-25
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
    task(file.to_sym) {}
    year = file[-4..]
    write_markdown(file, year)
    write_yaml(file)
  end
end

task :delete_course do
  (ARGV[1..]).each do |course|
    task(course.to_sym) {}
    year = course[-4..]
    FileUtils.rm "_data/#{course}.yml" if File.exist? "_data/#{course}.yml"
    FileUtils.rm "#{year}/#{course}.md" if File.exist? "#{year}/#{course}.md"
  end
end

task remove_course: :delete_course

task :serve do
  system("bundle exec jekyll serve")
end
