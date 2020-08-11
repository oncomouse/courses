# Course Site

This site is based on my [jekyll-syllabus](https://github.com/oncomouse/jekyll-syllabus) project, which generates readable, mobile-friendly, single-page course syllabuses using Jekyll.

## Course Management

Use `rake course <course tag>` to create the YAML (in `_data/`) and Markdown (in `courses/<year>`) files for a new course syllabus.

Use `rake delete_course <course tag>` to remove a course syllabus.

## Course Configuration

If `toc` in `_config.yaml` is set to `true`, an auto-generated table of contents will appear on each page. If `toc` is set to `true` in a syllabus's YAML front matter, an auto-generated table of contents will appear on that particular page.

TOC is disabled by default.

## Using This On Your Own

The `clean` branch of this repository contains a version of this repository without my course data included. If fork that branch, you can use this site on your own.

See [oncomouse/jekyll-syllabus](https://github.com/oncomouse/jekyll-syllabus) for more information on how to configure and write syllabuses.
