---
layout: default
title: "Hands-on Activity 3: What is Markup?"
---
But, how do we include these links somewhere on our site?

## Site Theming With Jekyll

Some of you may have already changed the theme of your Jekyll blog. If you haven't (and you want to), on the "Settings" page of your repository, under the "GitHub Pages" heading, you will find an option for "Theme Chooser." There are a few options available, so pick one that you like.

If you did change your theme, you'll notice a new line in your `_config.yml` file:

~~~yaml
#
# This file contains configuration flags to customize your site
#
# Name of your site (displayed in the header)
title: Dr. Pilsch's Blog
# Short bio or description (displayed in the header)
description: This is my blog

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

theme: jekyll-theme-cayman
~~~

That last line is where GitHub pages changes your theme. It is adding a new key (`theme`) to the dictionary described by `_config.yml`. I set mine to "cayman" in the example above.

If you have not changed your theme, you are using a theme called "primer."

The [GitHub user "pages-themes"](https://github.com/pages-themes) is the account from which GitHub manages the themes available in Pages. If you go to their user page, each theme's source code will be linked.

If we want to add our links somewhere on our site, we have to tell Jekyll to use an updated version of the template that is in our repository instead of user `page-theme`'s repository.

This process can be a bit tricky and involves some research, so I'm going to show you how to do this for the primer theme and then I'll challenge you to do it on your own site.

What I have to do is figure out how my theme displays the 
