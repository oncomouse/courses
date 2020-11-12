---
layout: default
title: "Andrew Pilsch's Courses"
---
# Courses I've Taught

{% comment %}Guess the starting year, but we can bump it later.{% endcomment %}
{% assign year = "now" | date: "%Y" | abs %}
{% assign earliestYear = year %}
{% assign semester_order = "spr,sum,fall" | split: "," %}
{% comment %}
Go through each file, finding the keys that have course data while also
determining the earliest and latest years courses are available.
{% endcomment %}
{% capture keys %}{% for object in site.data %}{% if object[1].hidden %}{% continue %}{%endif%}{% unless object[1].start %}{% continue %}{% endunless %}{% assign y = object[0] | slice: -4, 4 | abs %}{% if y < earliestYear %}{% assign earliestYear = y %}{% elsif y > year %}{% assign year = y %}{% endif %}{{ object[0] }} {% endfor %}{% endcapture %}
{% assign keys = keys | split: " " %}
{% comment %}
This code is awful, but I can't figure how else to do it in Liquid. We go year by year, then we go by semester order, then we go through each key to find matches for semester and year. We print those.
{% endcomment %}
{% capture courses %}{% for y in (earliestYear..year) %}{% for s in semester_order %}{% for key in keys %}{% assign my = key | slice: -4, 4 | abs %}{% assign ms = key | slice: 7,3 | replace: "fal", "fall" %}{% if ms == s and my == y %}{{ key }} {% endif %}{% endfor %}{% endfor %}{% endfor %}{% endcapture %}
{% assign courses = courses | split: " " | reverse %}
{% comment %}
Now we can print the list:
{% endcomment %}
{% for key in courses %}{% assign course = site.data[key] %}{% assign year = course.start | slice: 0,4%}{% capture course_display_name %}{{ key | slice: 0,4 | upcase }} {{ key | slice: 4, 3}}{% if course.title %}: {{course.title}}{%endif%}, {{ key | slice: 7,3 | replace: "fal", "Fall" | replace: "spr", "Spring" | replace: "sum", "Summer" }} {{ year }}{% endcapture %}
* [{{course_display_name}}]({{ year | append: "/" | append: key | relative_url }}){% endfor %}
{: .f2}
