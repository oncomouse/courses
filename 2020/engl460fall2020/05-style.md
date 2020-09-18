---
layout: default
title: "ENGL 460 – What is Style?"
---

# Overview

We have seen a few examples ([here](./03-markup-example.html) and [here](./04-metadata-example2.html)) of HTML where things don't looks so fancy. But this chapter looks better than those examples. The content is neatly centered on the page, it's a font that isn't Times New Roman, there colors that aren't *the default blue*{:style="color:#00F; font-style: normal;"}. How is that possible?

The answer is through style.

HTML has evolved as an explicit semantic markup language that defines what content is, instead of how it is to be displayed. This is why we talk about *emphasis* and **strong emphasis** instead of italics and bold. To make this division clear, HTML files often rely on style information supplied by a separate stylesheet, written in a language called CSS (Cascading Style Sheets)

In this chapter, we will

1. Look briefly at how CSS works.
1. Learn how to apply CSS to HTML and Markdown documents.
1. Learn how to extend built-in styles in Jekyll.

**Important**: The entire CSS specification is huge and gives authors control over every aspect of a website's appearance. This chapter introduces the basic structures of CSS and how to use them. If you want to author your own CSS, you will need to do research into the language and learn some of the properties CSS can change.

# CSS: Describing Web Styles

CSS consists of a series of rules that control how elements on a page are displayed. Here's one now:

~~~css
p {
	font-size: 3em;
	color: red;
	margin-bottom: 4px;
}
~~~

The rule consists of two elements:

1. A **selector**
1. A **declaration block**

The selector is anything before the left pointing brace (`{`), in this case `p`. A declaration block follows a selector and is contained within braces (`{` and `}`). The selector tells your web browser to which elements on a page the rule applies. The declaration block contains the aspects of the matched elements to change.

Declaration blocks are further composed of **declarations**. A declaration contains a **property** and a **value**. The property is a string that cannot contain any spaces (words are separated by hyphens (`-`)) and are defined by the CSS specification. The value is separated by a colon (`:`) and can contain a variety of values, depending on the particular property.

To return to the above example, the selector tells the browser to match any paragraph tags (`<p>`) found in the document. The declaration block contains three declarations:

1. `font-size` -- change the size of the font (we set it to `3em`, which means "three times bigger than it would normally be" in CSS)
	* Numerical values in CSS have to have a unit attached (unless they are `0`)
	* For more on [CSS units, check out this tutorial](https://www.w3schools.com/css/css_units.asp)
1. `color` -- changes the color of the text, in this case to `red`.
	* For more on [CSS colors, check out this tutorial](https://www.w3schools.com/colors/default.asp)
1. `margin-bottom` -- changes the size of the bottom margin (which is the space between the edge of the element and its neighbor)
	* CSS margin and padding, which control the size of an element, are a bit tricky.
	* For more on this, [check out this tutorial on the CSS box model](https://www.w3schools.com/css/css_boxmodel.asp)

## Writing CSS Selectors

CSS has three ways of selecting elements:

1. By Tag
1. By Class
1. By ID

Tag here refers to the name of HTML tag, so selectors such as `a`, `p`, `h1`, etc., will select all tags that match the tag in question.

Classes and IDs are defined by the website's author and are used to identify tags. A class is a group of elements (either one tag or many tags) that the user wants to share some CSS styling. An ID is a unique identifier applied to one element, individually.

To use an analogy, classes in CSS are like families: many people belong to a particular family, though they may live in different places and have different jobs. IDs, though, are like social-security numbers in the United States, you are uniquely identified by your SSN. See ["Adding Style to HTML"](#adding-style-to-html) below for more information about how to use these.

**Class selectors** can be named anything you want (though, like everything in CSS, they cannot contain spaces). They are written starting with a dot (`.`) followed by the class name.

Considering the earlier example where we changed the paragraph styles, imagine we have reloaded our site with its new CSS and realized that making our paragraphs *red*{:style="color: #F00; font-style: normal;"} was a *terrible* idea. We still need some red paragraphs, though, so we can make a class, instead:

~~~css
.red-paragraphs {
	font-size: 3em;
	color: red;
	margin-bottom: 4px;
}
~~~

Now all our paragraphs won't have red text, but we can apply the class (which we'll learn how to do in a minute) to certain elements (not even just paragraphs).

**ID selectors** work the same way but apply to only one element. They can also be named anything you want, but are written with an octothorpe (`#`) followed by the ID name.

Here we define a single element that will have our red font stylings:

~~~css
#red-paragraph {
	font-size: 3em;
	color: red;
	margin-bottom: 4px;
}
~~~

**Important Information**: CSS was first published in 1996. Since that time, a series of best practices has developed around the standard, as happens with many standards. The general consensus in CSS development is that you should *only* use class selectors, avoiding ID and tag-based ones. Classes are the most versatile and do the best job of future-proofing your CSS code (in case you change the HTML).

# Adding Style to HTML

Now that we have seen a little about CSS, let's learn how to use it in our HTML documents!

## Adding CSS to your HTML files

"CSS is all great, Dr. Pilsch," you may be thinking, "but how do I use it?" And that's good question!

We have to define CSS somewhere in our HTML document in order to use it. CSS can be defined inside of an HTML file (which makes it in-line CSS) or in an external `.css` file. **The external method is greatly preferred** and should be used in the vast majority of situations.

CSS is **always** defined inside the document's `<head>` tag, as CSS is another example of metadata.

However, here is how to do both.

### In-line CSS

Consider a simple HTML document:

~~~html
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Example Site</title>
	</head>
	<body>
		<h1>Page Title</h1>
		<p>Here is an example paragraph.</p>
		<p>Here is another example paragraph.</p>
	</body>
</html>
~~~

To include some in-line styles, we use the `<style>` tag:

~~~html
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Example Site</title>
		<style>
		p {
			font-size: 1.25em;
			line-height: 1.5;
		}
		h1 {
			color: #333;
		}
		</style>
	</head>
	<body>
		<h1>Page Title</h1>
		<p>Here is an example paragraph.</p>
		<p>Here is another example paragraph.</p>
	</body>
</html>
~~~

That will change the color of the `<h1>` tag and the font size and line spacing of the `<p>` tags.

#### Why Not Use In-line Styles

If you use in-line styles, you have to include the same stylesheet on every page in your site. If you then change that style, you have to change every page on your site. You have to do this every single time you change something about your design. If you have hundreds of pages, that can be a real pain.

While Jekyll's templating system could mitigate this, HTML's existence as a semantic markup language also means that design and content *should* be separate. Storing CSS in the HTML document undercuts this. Further, and we won't talk about this in this chapter, when stylesheets are external, it is possible [to load different stylesheets in different scenarios, like when our user is making use of assistive technology such as a Braille reader or when the user is printing our site](https://www.smashingmagazine.com/2011/11/how-to-set-up-a-print-style-sheet/). Neither of these are possible with in-line stylesheets.

### External CSS Files

Ok, so we don't want to use in-line stylesheets. What can we do?

Stylesheets can also be stored in external files with a `.css` extension and then connected to the web page using a `<link>` tag.

The previous example would split into two files, a new CSS file we'll call `site.css`:

~~~css
p {
	font-size: 1.25em;
	line-height: 1.5;
}
h1 {
	color: #333;
}
~~~

And the HTML, which now contains a link to the CSS file:

~~~html
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Example Site</title>
		<link rel="stylesheet" href="site.css">
	</head>
	<body>
		<h1>Page Title</h1>
		<p>Here is an example paragraph.</p>
		<p>Here is another example paragraph.</p>
	</body>
</html>
~~~

Now we have our site's CSS loaded in from an external file!

## Applying your CSS styles to HTML

# Compound CSS

## Nesting Selectors

HTML, as you remember, is a hierarchical markup language, with children elements contained within parent elements. CSS can write selectors to take advantage of this structure.



## Combining Selectors

# Applying Style in Jekyll Markdown

# Creating New Styles

## Using Developer Tools to Edit CSS Live
