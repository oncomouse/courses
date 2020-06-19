# frozen_string_literal: true

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

     output = %(---
layout: syllabus
title: "#{guessed_title}"
---)

    contents = {}
    Dir.glob("#{course_dir}/source/**/*.html.md").each do |markdown_file|
      next if File.basename(markdown_file).match?(/^index/)
      
      yaml, *markdown = File.read(markdown_file)[3..].split("---")
      metadata = YAML.load(yaml)
      contents[metadata['page_link_name']] = markdown
    end
    contents.keys.sort do |section_name|
      section_content = contents[section_name]
      output += %(
# #{section_name}

#{section_content})
    end
    output += %(
# Schedule

{% include schedule.html schedule="#{course_key}" %})
    File.write("#{year}/#{course_key}.md", output)
  end
end
