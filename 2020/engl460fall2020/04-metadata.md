---
layout: default
title: "ENGL 460 – What is Metadata?"
---

# Overview

Last week, we learned how to use plain text markup formats to create web content using HTML and Markdown. This week, we will take a small step back and discuss how markup languages also allow us to define "metadata" which is "data about data." This concept allows us to not only define content, as we have already done, but to describe that content in ways that are meaningful to both humans and machines.

In this chapter, we will learn:

1. Definition of metadata
1. How to define metadata in Jekyll
1. How to define metadata in HTML
1. Use-case for metadata: SEO

## Definition of Metadata

## Defining Metadata in Jekyll

We have already encountered metadata in Jekyll, which makes extensive use of the idea. Each of your posts, as well as the HTML files we have created, begin with a set of three dashes, like so:

~~~markdown
---
title: "New Post"
layout: post
---

Hey, blog!
~~~

The technical term for the content between the two sets of three hyphens is a "YAML metadata block," it lets Markdown documents contain information about the post that is not directly produced in the post itself. This is metadata.

On the [course blog](https://oncomouse.github.io/460blog), I use some more metadata to categorize your semester recap posts. Here's an example:

~~~markdown
--- 
title: "Recap Post"
author:
	name: oncomouse
	url: "https://oncomouse.github.io"
categories:
- recap
- fall2020
layout: post
---

Content of the recap post.
~~~

## Defining Metadata in HTML

## Metadata for Search Engines

## Conclusion

