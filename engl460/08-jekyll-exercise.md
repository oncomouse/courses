---
layout: default
title: "Hands-on Activity 9: Getting Started with Jekyll"
---

# Getting Started

This document will teach you how to create a basic blog using [Jekyll](https://jekyllrb.com/) and GitHub Pages

## Before You Begin

1. You will need a GitHub account for this tutorial
	* Don't have one yet? [Click here](https://github.com/join?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)
	* You might also think about signing up for the [Student Developer Pack](https://education.github.com/pack)

## Creating Your Site

GitHub uses the concept of a **repository** to organize projects. GitHub "repos" have a lot of features not covered in this tutorial, but we will be creating our first repository for this project.

Visit [http://github.com/new ](http://github.com/new) to create a new repo. When there, you will need to call your new repository **\<username>.github.io**, **where you replace \<username> with your GitHub username**. If your GitHub username was `just_an_aggie`, you would type **just_an_aggie.github.io** as your repository name. If your GitHub username was `some_student`, you would type **some_student.github.io** as your repository name.

<figure>
<img alt="An example of creating a new repository on GitHub" src="/courses/engl460/images/jk-create-repo.gif">
<figcaption>Creating a new repository on GitHub.</figcaption>
</figure>

## Adding Initial Content

We have to create a few files before we can get started blogging:

### Creating `_config.yml`

To create your first file, go to your repository (this is the page you should be on if you just created your repository).

Under the heading "Quick setup — if you’ve done this kind of thing before," there is a link called for "creating a new file". Click on that.

On the resulting page, in the box captioned "Name your file," type `_config.yml` (make to include the underscore at the start of the filename).

Copy and paste the following code block into the file editor (to the right of the number 1 and below "Edit new file").

~~~yaml
#
# This file contains configuration flags to customize your site
#
# Name of your site (displayed in the header)
title: Site Title
# Short bio or description (displayed in the header)
description: A Blog

#
# !! DON'T EDIT BELOW THIS MESSAGE
#
# Use the following plug-ins
plugins:
  - jekyll-sitemap # Create a sitemap using the official Jekyll sitemap gem
  - jekyll-feed # Create an Atom feed using the official Jekyll feed gem

# Exclude these files from your production _site
exclude:
  - Gemfile
  - Gemfile.lock
  - LICENSE
  - README.md
  - CNAME
~~~

In the editor, where the file says `title: Site Title`, you can change "Site Title" to whatever you want your blog to be called. You can also edit `description: A Blog` to better describe your site. YAML is the file format used to configure your blog. [Check out this tutorial](https://rollout.io/blog/yaml-tutorial-everything-you-need-get-started/) if you would like to learn more.

When you are done editing your file, scroll to the bottom of the page and click "Commit new file" to save your changes. "Commiting" is the fancy GitHub lingo for saving files to your repo.

<figure>
<img alt="Creating the _config.yml file" src="/courses/engl460/images/jk-create-config.gif">
<figcaption>Creating a new <code>_config.yml</code> file.</figcaption>
</figure>

### Creating `index.html`

Having created our first file, we need to create one more before we can start blogging. It's going to be called `index.html`. You can think of it as the front page of your new blog.

If you have learned HTML, the code we are copying may look a little strange. [Jekyll](https://jekyllrb.com/), the blogging software used by GitHub Pages, uses some special code to turn our posts into HTML.

If you haven't learned HTML yet, this all will probably look like a foreign language. But that's ok, we'll talk more about what all this does.

So on your repo, click on the "Add file" menu and select "Create new file" from the drop-down menu.

In the "Name your file" box, type "index.html". In the file editor, paste the following code block:

{%raw%}
~~~html
---
layout: default
---
<div class="posts">
  {% for post in site.posts %}
    <article class="post">

      <h1><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h1>

      <div class="entry">
        {{ post.excerpt }}
      </div>

      <a href="{{ site.baseurl }}{{ post.url }}" class="read-more">Read More</a>
    </article>
  {% endfor %}
</div>
~~~
{%endraw%}

Scroll to the bottom and click "Commit New File" to commit `index.html` to your repo.

<figure>
<img alt="Creating the index.html file" src="/courses/engl460/images/jk-create-index.gif">
<figcaption>Creating a new <code>index.html</code> file.</figcaption>
</figure>

## Checking to Make Sure GitHub Pages Is Working

In order to start sharing our blog on the Internet, we need to make sure GitHub Pages Works.

On your repo page, click on the "Settings" tab. Scroll to the "GitHub Pages" heading. 

You should see a blue message saying "Your site is published at" followed by a link to your site. 

Click the link and you should see your site!

If you don't something has gone wrong. Now would be a good time to ask for help.

<figure>
<img alt="Checking the GitHub Pages source" src="/courses/engl460/images/jk-settings.gif">
<figcaption>Success! This message displays when GitHub Pages has built our site</figcaption>
</figure>

# Customizing Site Title

To change "Site Title" as the name of your site, we will need to edit the `_config.yml` file we created earlier. This file is called the site's configuration: it contains metadata about the site that tells GitHub Pages how to display and configure our site.

To edit your file, go back to the repo main page. Click on `_config.yml` in the list of files.

When the page showing the contents of `_config.yml` loads, look for a small pencil icon on the right side of the page. It will be to the right of buttons for "Raw" and "Blame". Clicking this pencil will let you edit the file. Click it now.

We are back in the same editor we used to create the file.

Looking at the file, you should see a line that begins with `title:`. This line controls the setting for our site's title. We can change what comes after the colon (`:`) to change our site's title. Set your title to whatever you want.

You can also change the contents of the line that begins `description:` to give your site a more accurate description.

When you are happy with your site's title and description, click the button labelled "Commit changes".

<figure>
<img alt="Changing the title and description of our site" src="/courses/engl460/images/jk-change-config.gif">
<figcaption>Changing the title and description of our site on GitHub.</figcaption>
</figure>

After the site has rebuilt (see below), you should see the results of your changes:

<figure>
<img alt="My Blog Reloaded with New Title and Description" src="/courses/engl460/images/jk-change-config-success.png">
<figcaption>Results of setting a new title, a new description, and waiting for the site to be rebuilt.</figcaption>
</figure>

## "My Title Isn't Showing Up!"

Did you get excited and immediately reload your blog and not see your new title? You might be as impatient as I am!

GitHub Pages has to build your site by turning all the files we have written into a website that can be displayed in your browser. This takes time. Time that we have to wait through.

From your repo page, go to "Settings" and scroll to the "GitHub Pages" section. If you see a blue message that reads "Your site is ready to be published at" followed by a link to your site, your site is in the queue to be built. You can keep reloading the page while you wait, or you can be more patient than me and just wait.

Within at most a minute, you will see a green message that reads "Your site has been published at" followed by a link to your site, your site has been built. Click the link and you can see your new blog post!

If you see a red message, something went wrong. Now is a good time to ask for some help.

If everything is working, **let's create some content!**

# Your First Blog Post

Once again, we will need to create a file in our repository. This time, we will also be creating a folder!

Blog posts live in a special folder called `_posts` in our repo. Additionally, posts have a special file name structure, which is `YYYY-MM-DD-title.md`. Here `YYYY` would be the present year as a four digit number (2020 for me), `MM` would be today's month as a two digit number (07 for me; you have to use a 0 for the first digit when the month is less than 10), `DD` is today's day of the month as a two digit number (29 for me, again you have to use a 0 for the first digit if less than 10) and `title` is anything you want, but is usually what is called a "slug," a representation of the post's title using only letters, numbers, and the dash (`-`) character.

So, to make our post, once again click on the "Add File" menu on your repo's main page and select "Create new file".

On the new file page, type `_posts/2020-07-29-first-post.md` using whatever today's date actually is for you (or you can just use mine from the past). I am going to title my first post "First Post" because I'm so creative and that's why I'm using `first-post` as my slug. You can use whatever you want for your slug, or you can copy my totally original title.

You'll note that when you type the `/` character it adds `_posts/` after the name of your repo and removes it from the text box. That's just GitHub's way of acknowledging it knows you are creating a folder.

Copy the contents of the code block below and paste it into the file editor:

~~~markdown
---
layout: post
title: First Post
---

This is my **first post**.

[Here's a website I like](http://seriouseats.com)
~~~

Let's look at this file, real quick. The first four lines, the two sets of three hyphens (`---`) and the other two is called a YAML header. It's written in YAML, the language we saw when we created our `_config.yml` file. We are telling Jekyll two things in this YAML header:

1. This file contains a blog post (by setting `layout: post`)
2. This post is titled "First Post"

This is more "**metadata**." Where `_config.yml` provides metadata about our site, this YAML header provides metadata about the individual post. Any digital object we can see can have metadata describing it.

Below the second set of three hyphens is the body of our post, which is written in a language called Markdown. Markdown is a simplified version of HTML. We have marked **first post** to be bold by surrounding it with two sets of asterisks (`**`). The line that contains "Here's a website I like" contains a link. The content in brackets (`[` and `]`) is what gets displayed to the user. The content in parentheses (`(` and `)`) is the URL for the website. Try copying and pasting your own favorite website into the parentheses and changing the content that displays to the user.

When you are happy with your first post, click "Commit new file"

<figure>
<img alt="Creating the first post" src="/courses/engl460/images/jk-first-post.gif">
<figcaption>Creating your first blog post.</figcaption>
</figure>

Once you wait for the site to rebuild, again, you should be able to reload your site and see your first blog post!

<figure>
<img alt="My blog showing the post I just created, titled 'My First Post'" src="/courses/engl460/images/jk-first-post-success.png">
<figcaption>The results of successfully creating your first blog post and waiting for your site to rebuild.</figcaption>
</figure>

That's it for this tutorial. You should now have a functioning blog built on GitHub Pages and [Jekyll](https://jekyllrb.com/)!

Now, you may want to review [the syllabus](../engl460fall2020) and edit the first post following the prompt for your [blog check-in assignment](../engl460fall2020#blog-check-in)

# Further Reading

Now that you have created a basic blog, there are more things to learn. Here are some links to topics related to customizing and posting on your new blog.

* [Learning Markdown](https://www.markdowntutorial.com/)
* [Customizing Your GitHub Pages blog](https://help.github.jp/enterprise/2.11/user/articles/creating-a-github-pages-site-with-the-jekyll-theme-chooser/)
* [Advanced Customization for your GitHub Pages blog](https://help.github.jp/enterprise/2.11/user/articles/customizing-css-and-html-in-your-jekyll-theme/)
* [Jekyll documentation for Posts](https://jekyllrb.com/docs/posts/)
	* Learn how to use categories and tags on your posts
