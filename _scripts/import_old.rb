# frozen_string_literal: true

# ---
# title: "Science Fiction"
# number: ENGL 334
# term: Spring 2020
# description: |
#   Origins and development of the science fiction genre.
# primary_color: yellow
# secondary_color: blue
# instructor:
#   name: Andrew Pilsch
#   email: apilsch@tamu.edu
#   office_hours: Online by request


require 'shellwords'
require 'fileutils'
require 'yaml'

ARGV.each do |dir|
  files = `find #{Shellwords.escape(dir)} -name "schedule.yml"`.chomp
  files.split("\n").each do |file|
    course_dir = file.split('/')[0..-3].join('/')
    course_key = File.basename(course_dir)
    course_match = course_key.match(/^(engl)([0-9]{3})([a-z]{3,4})([0-9]{4})/)
    next unless course_match

    department, number, semester, year = course_match.captures

    guessed_title = "#{department.upcase} #{number}, #{ semester == 'fall' ? 'Fall' : 'Spring' } #{year}"

    yaml_file_name = "./_data/#{course_key}.yml"
    FileUtils.cp(file, yaml_file_name) unless File.exist? yaml_file_name

    dir = "./#{year}"
    Dir.mkdir dir unless Dir.exist? dir

    metadata = {}
    metadata = YAML.load(File.read("#{course_dir}/data/course.yml")) if File.exist? "#{course_dir}/data/course.yml"
    metadata = metadata.map{ |k,v| [k.sub(/^course_/,''), v]}.to_h
    metadata.delete('primary_color')
    metadata.delete('secondary_color')
    metadata['layout'] = 'syllabus'
    metadata['title'] = guessed_title

     output = %(---
#{YAML.dump(metadata)}
---)

    contents = {}
    Dir.glob("#{course_dir}/source/**/*.html.md").each do |markdown_file|
      next if File.basename(markdown_file).match?(/^index/)
      
      yaml, *markdown = File.read(markdown_file)[3..].split("---")
      metadata = YAML.load(yaml)
      contents[metadata['page_link_name']] = markdown.join('---')
    end
    contents.sort_by{|k,v| v}.to_h.each_pair do |section_name, section_content|
      if section_content.match(/^\s*# /)
          output += section_content
      else
        output += %(
  # #{section_name}

  #{section_content})
      end
    end
    output += %(
# Schedule

{% include schedule.html schedule="#{course_key}" %})
    File.write("#{year}/#{course_key}.md", output)
  end
end
