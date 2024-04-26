---
layout: default
title: "Andrew Pilsch's Courses"
---
# Courses I've Taught

{% comment %}Guess the starting year, but we can bump it later.{% endcomment %}
{% assign year = "now" | date: "%Y" | abs %}
{% assign earliestYear = year %}
{% assign semester_order = "spr,sum,fall" | split: "," %}
{% assign syllabuses = "" | split: "" %}
{% for page in site.pages %}
{% assign key = page.path | split: "/" | last | split: "." | first %}
{% assign syllabus = "" | split : "" %}
{% if site.data[key] %}
{% assign syllabus = site.data[key] %}
{% elsif page.course %}
{% assign syllabus = page.course %}
{% endif %}
{% unless syllabus.start %}{% continue %}{% endunless %}
{% if syllabus.hidden %}{% continue %}{% endif %}
{% assign y = syllabus.start | date: "%Y" | abs %}{% if y < earliestYear %}{% assign earliestYear = y %}{% elsif y > year %}{% assign year = y %}{% endif %}
{% assign term = syllabus.term %}
{% unless syllabus.term %}{% assign y = key | slice: -4, 4 | abs %}{% assign s = key | slice: 7,3 | replace: "fal", "Fall" | replace: "spr", "Spring" %}{% assign term = s | append: " " | append: y %}{% endunless %}
{% assign number = syllabus.number %}
{% unless syllabus.number %}
{% capture number %}
{{ key | slice: 0,4 | upcase }} {{ key | slice: 4, 3}}{% endcapture %}
{% endunless %}
{% capture link %}
[{{number}}{%if syllabus.title %} {{syllabus.title}}{%endif%}, {{term | replace: "Spr ", "Spring "}}]({{ y | append: "/" | append: key | append: ".html" | relative_url }})
{% endcapture %}
{% assign line = key | append: "::" | append: link %}
{% assign syllabuses = syllabuses | push: line %}
{% endfor %}
{% assign syllabuses = syllabuses | sort | reverse %}
{% assign output = "" | split: "" %}
{% for y in (earliestYear..year) %}{% for s in semester_order %}{% for syllabus in syllabuses %}
{% assign key = syllabus | split: "::" | first %}
{% assign link = syllabus | split: "::" | last %}
{% assign my = key | slice: -4, 4 | abs %}{% assign ms = key | slice: 7,3 | replace: "fal", "fall" %}
{% if ms == s and my == y %}
{% assign output = output | push: link %}
{% endif %}
{% endfor %}{% endfor %}{% endfor %}
{% assign output = output | reverse %}
{% for link in output %}
* {{ link }}{% endfor %}{: .f2}
