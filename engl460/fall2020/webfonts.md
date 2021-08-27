---
layout: default
title: "ENGL 460 – Using Web Fonts"
---

How do we use nice fonts on the web? This has been a surprisingly complicated question for much of the history of web development. Fonts, on the web, are something that must be provided by the user, so if you have a font installed on your computer and you use it on your website, other users won't see the correct font.

Thankfully, we now have something called web fonts, which are font files that load over the Internet (off a server you control or at least have access to) and make sure that your website displays the same regardless of what is on a particular user's machine.

The best place for free web fonts on the Internet is [Google Fonts](https://fonts.google.com) ([Typekit](https://fonts.adobe.com/) is great if you don't mind paying).

There are two steps to use a web font:

1. Include the CSS file that loads the font for the user
1. Add the font to your CSS

On [Google Fonts](https://fonts.google.com), you can browse for a font and then select the faces you want. The faces are sorted by weight and face. Weights are represented by words in certain cases (`normal` and `bold`) but are also more accurately presented as numbers from 100 to 900 (thinnest to thickest). `normal` is 400 and `bold` is 700. See below if you would like to use different default weights.

![Google Fonts sorted by weight and face](/courses/engl460/images/google-fonts.png)
{:.text-center}

On Google Fonts, you click "+ Select This Style" to add different fonts to your site. If you plan to use bold, italic, and normal fonts (and you are fine with the standard weights), you need 400, 400 Italic, 700, and 700 Italic. However, will you really use bold italic all that often? You can shave some time off the loading of your site by not loading unused fonts.

Anyway, once you have your fonts selected, Google Fonts will present you with a `<link>` HTML tag. Copy this and paste it somewhere in the `<head>` of your layout (usually `_layouts/default.html`). This tells your site to load the font. We still have to connect it.

Back on Google Fonts, find the next code the present. It is a CSS property that looks something like `font-family: Roboto, sans-serif` but with `Roboto` replaced with the name of your font. It is the CSS property that sets the font for a particular rule. It includes the web font and a fallback in case the web font fails to load, here one of the three generic fonts in CSS (`sans-serif`, `serif`, and `monospace`). Copy this CSS. Next, in your `assets/css/site.scss` file, add a rule for the HTML tag and include the copied CSS. Place this after the include tag in your SCSS file. For my example using Roboto, it will look like this:

~~~css
html {
	font-family: Roboto, sans-serif;
}
~~~

Now your site should be using the new font!

Here's a GIF of the whole process (including some fixes for Primer discussed below):

<figure>
<img src="/courses/engl460/images/webfonts.gif" alt="Setting a Web Font">
<figcaption>I know it's "your". This GIF was the fifth take and I'm tired.</figcaption>
</figure>

## It Didn't Work

It's best practice in web design to set the main font for the site in the CSS selector for the HTML tag, but some people (like the makers of the default primer theme) style the body tag because we can't have nice things. If your GitHub Pages theme does this, you can fix it by adding:

~~~css
body {
	font-family: inherit;
}
~~~

Primer, because, again, we can't have nice things, also adds a class called `.markdown-body` to the main content div that also sets the font. To fix that too, you need a rule like this:

~~~css
body,
.markdown-body {
	font-family: inherit;
}
~~~

If you're using a different theme, you may have different problems here, so make sure to use the Developer Tools to find where the font is being set wrong (or ask me in office hours or over DM).

**Sidebar:** the convoluted process to change the font on the Primer theme is why it's a good idea to understand web design best practices and to follow them. Otherwise, you have to do a bunch of detective work to figure out how to fix something that shouldn't have been done in the first place.

## Using Different Font Weights

Let's say you want to go for the cool, futuristic look of a thinner font on your cool futuristic site. We could use Roboto at 300 for our main font and at 400 for our strong emphasis font. So, we've placed the `<link>` tag from Google Fonts in our `<head>` but how do we display the skinny fonts?

We use the `font-weight` CSS property. Here's how we might do it:

~~~css
html {
	font-family: Roboto, sans-serif;
	font-weight: 300;
}

/* Reset the strong emphasis font weight:*/
b,
strong,
h1,
h2,
h3,
h4,
h5,
h6 {
	font-weight: 400;
}
~~~

First, we set the default font weight to 300. Then we reset all the tags that default to the bold weight (which is 700) to 400. Anywhere else your theme uses bold would have to be changed to 400, so you may have to do some digging in Developers' Tools to get everything switched.

## Using Multiple Web Fonts

Pairing two fonts on a site (one for headings and a second for body) is a great and classy design practice. You can do this with Google fonts, too.

Here are two articles discussing some pairs that designers like:

1. [https://www.pagecloud.com/blog/best-google-fonts-pairings](https://www.pagecloud.com/blog/best-google-fonts-pairings)
1. [https://www.reliablepsd.com/ultimate-google-font-pairings/](https://www.reliablepsd.com/ultimate-google-font-pairings/)

When selecting fonts, you can choose more than one font family to add to your bundle on Google Fonts, as the image below shows:

![Choosing Two Fonts](/courses/engl460/images/google-fonts-multiple.png)

So, you would then add your `<link>` the way you normally would, but your CSS would look like this:

~~~css
html {
	font-family: 'Source Sans Pro', sans-serif;
}

strong,
b {
	font-weight: 600;
}

h1,
h2,
h3,
h4,
h5,
h6 {
	font-family: 'Playfair Display', serif;
	font-weight: 600;
}
~~~

We set our display font (the one we use for headers) in our h1-h6 rule, and now we have two separate fonts displaying on our site.
