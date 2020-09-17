---
layout: default
title: "Hands-on Activity 4: What is Metadata?"
---

In this activity, we will learn how to use metadata to categorize our posts.

## Adding Categories to Post

To first start categorizing our posts, we need to edit each of our posts, adding them to a category. You can use multiple categories for each post, as you see fit.

For instance, I could categorize a first post into two categories:

~~~markdown
---
title: About Me
author:
	name: Dr. Pilsch
	url: "https://andrew.pilsch.com"
categories:
- about
- welcome
---

Hello
~~~

That will create two categories `about` and `welcome`. If I use them again on different posts, I will add more posts to each category. If I define a new category in a different post, it will become a new category for the whole site. You can generate as many categories as you need.

**Note on Uppercase vs Lowercase**: It doesn't really matter if you name your categories in uppercase (`About`), lowercase (`about`), or in all caps (`ABOUT`), as far as Jekyll is concerned. However, it is best practice, as far as building a neat and tidy information space, to be consistent. If you use all lowercase for one category, use it for all of them.

## Showing Categories on Posts

Like how we added a menu to our layout in the previous exercise, we can add categories to our site by editing our template's functions.

For the **primer** theme, once again, I would edit the `_layouts/default.html`. *Most other themes have a separate `_layouts/post.html` layout for blog posts; that is the one you would want to edit*.

The code to add is:

~~~html
{% if post %}
	{% assign categories = post.categories %}
{% else %}
	{% assign categories = page.categories %}
{% endif %}
<p><strong>Posted In</strong>: {{categories | capitalize | join: ', '}}</p>
~~~

This will print the categories as a list joined by commas.

## Making the Category Page 

We can also present a page with all our posts sorted by category. To do this, we create a page, say `categories.html`. We can add the following content to it:

~~~html
---
layout: default
---
<h1>Posts by Categories</h1>

<ul>
  {% for category in site.categories %}
  {% capture category_name %}{{ category | first }}{% endcapture %}
  <li>{{ category_name | capitalize }}
    <ul>{% for post in site.categories[category_name] %}
      <li><a href="{{ site.baseurl }}{{ post.url }}">{{post.title}}</a></li>
      {% endfor %}
    </ul>
  </li>
  {% endfor %}
</ul>
~~~

We could then add a link to `categories.html` to our menu and have that available to help our users navigate our site.

## Your Challenge for the Week

How might you categorize your posts? Add categories to your blog posts, install a categories page, and add it to the site menu you made last week!

Good luck!
