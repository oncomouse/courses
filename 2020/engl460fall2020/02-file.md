---
layout: default
title: "ENGL 460 – What is a File?"
---

# Overview

# Types of Files

# Plaintext File Types

Remember last week, when we were talking about a [shopping cart and how to describe it](#combining-lists-and-dictionaries)? We saw some JSON notation meant to represent our shopping cart. It looked like this:

~~~json
{
	"user-id": 12587603,
	"contents": [
		{
			"product": "Prunes",
			"quantity": 1
		},
		{
			"product": "Super Glue",
			"quantity": 2
		}
	]
}
~~~

When we were creating our blogs, we edited a file called `_config.yml`. The `.yml` extension tells the computer that `_config.yml` is a text document containing YAML information. YAML stands for "YAML Ain't Markup Language" because computer people have weird senses of humor, but it is another way of describing data to a computer that is also readable by humans. If we wanted to write our shopping cart in YAML instead of JSON, it might look like this:

~~~yaml
---
user-id: 12587603
contents:
  - product: Prunes
    quantity: 1
  - product: Super Glue
    quantity: 2
~~~

YAML uses a more compressed way of expressing data (called a "syntax" in computing) but represents the same data. If you don't believe me, [check either the YAML or JSON in this online converter](https://www.json2yaml.com/convert-yaml-to-json).

As we've been discussing, plain text is one way of expressing data. However, plain text can be formatted differently, telling the computer different ways to interact with the same basic, string data.

We have encountered three kinds of plain text files on our [Jekyll](https://jekyllrb.com) sites. In the tutorial, we created `.html`, `.md`, and `.yml` files. The `_config.yml` file uses YAML, which we discussed, above, while the `.md` and `.html` files contain content and layout information for our site. HTML is the "HyperText Markup Language," which is the basic language that describes every element on a website. Markdown is a simple document description language that your computer converts into HTML out of your site.

We will talk more about HTML and Markdown in future weeks, but one thing to note now is the important insight Markdown can grant us into why plain text file formats are so powerful and learning to think in terms of plain text is so important to understanding digital writing. Consider the paragraph above as it exists in the HTML code your browser is using to show this chapter:

~~~html
<p>We have encountered three kinds of plain text files on our <a href="https://jekyllrb.com">Jekyll</a> sites. In the tutorial, we created <code class="language-plaintext highlighter-rouge">.html</code>, <code class="language-plaintext highlighter-rouge">.md</code>, and <code class="language-plaintext highlighter-rouge">.yml</code> files. The <code class="language-plaintext highlighter-rouge">_config.yml</code> file uses YAML, which we discussed, above, while the <code class="language-plaintext highlighter-rouge">.md</code> and <code class="language-plaintext highlighter-rouge">.html</code> files contain content and layout information for our site. HTML is the “HyperText Markup Language,” which is the basic language that describes every element on a website. Markdown is a simple document description language that your computer converts into HTML out of your site.</p>
~~~

And the same paragraph in the Markdown file I wrote it in:

~~~markdown
We have encountered three kinds of plain text files on our [Jekyll](https://jekyllrb.com) sites. In the tutorial, we created `.html`, `.md`, and `.yml` files. The `_config.yml` file uses YAML, which we discussed, above, while the `.md` and `.html` files contain content and layout information for our site. HTML is the "HyperText Markup Language," which is the basic language that describes every element on a website. Markdown is a simple document description language that your computer converts into HTML out of your site.
~~~

Can you spot the differences?

There are many. The biggest difference is the HTML has what are called HTML "tags," which are special commands that tell your web browser what the data contained in each tag is, and therefore how to display it. The link to Jekyll is `<a href="https://jekyllrb.com">Jekyll</a>` in the HTML. The `<a>` tag tells your browser that "Jekyll" is a special piece of text called an "anchor". The part that reads `href="https://jekyllrb.com"` is a property added to the anchor, telling your browser where the anchor leads. Anchor tags such as this one are how all links on all websites  are made.

But there are several other differences between the HTML and the Markdown. For instance, note the quotation marks around "HyperText Markdown Language." In Markdown, `"HyperText Markup Language,"` becomes `“HyperText Markup Language,”` with the fancy quotations. This makes it possible to type without fancy characters and have them appear in our finished document. Markdown will also convert `--` to – and `---` to —.

An additional difference to note: the beginning and end of the paragraph in the HTML version are marked with paragraph HTML tags (`<p>` and `</p>`). This mark has to surround every paragraph in this document. There are 10 paragraphs already in this chapter, and more below. As I am using Markdown to write with (rather than worry about how particular elements such as a menu or a logo are displayed), having to mark each paragraph with `<p>` and `</p>` is a lot of work and distracts me from the important work of what I'm doing at the moment: writing.

The nit-picking distraction of HTML is why Markdown was created. On the one hand, you could look at Markdown and say "web designers made this because they are lazy" (and you wouldn't be wrong) but more expansively, you could argue that Markdown was created because having to type HTML tags and properties while writing is a distraction. Markdown is HTML minus the layout elements and focused on content-creation.

Similarly, YAML is a data description language focused on ease of human reading and simple syntax. JSON is a similar language that is less easy to read but much easier to parse by computer. JSON syntax is much pickier than YAML's and a bit hard to write. Both formats have been created for different purposes, even though they are both plain text.

And this is the power of plain text. We are always writing in the same way, in the same program, but we are writing using different formats which serve different purposes.

Text editor: https://code.visualstudio.com/
