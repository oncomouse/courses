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

Jekyll uses a convention that has developed around Markdown of including YAML information at the start of the document to describe more information about the contents. In the above post, we are setting the `layout` value for the page as well as the page's `title`.

### Important Note About Metadata in Jekyll

Any file not in a hidden folder (one that starts with `_`) that includes a YAML metadata block will be processed by Jekyll. Any files that do not contain metadata will be passed directly to output, unchanged.

This is important if, for some reason, you wanted to share a Markdown file on your site but you did not want it to become HTML. If we created the following file:

~~~markdown
# Title

This is some **Markdown** Content

* List
* Items
* Are
* Cool
~~~

When we [clicked on the link](/courses/2020/engl460fall2020/04-metadata-example1.md), our browser will try to download the file. This perhaps odd behavior is because GitHub Pages does not know what to do with the `.md` file we have asked it to give to us, so it offers it as a download. Odd, but expected.

Similarly, if we could create the following HTML page:

~~~html
<h1>Title</h1>
<p>This is some <strong>HTML</strong> Content</p>
<ul>
<li>List</li>
<li>Items</li>
<li>Are</li>
<li>Cool</li>
</ul>
~~~

### Another Metadata Example in Jekyll

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

We have already encountered YAML before, but to refresh, 

## Defining Metadata in HTML

## Metadata for Search Engines

## Conclusion

