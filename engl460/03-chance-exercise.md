---
layout: default
title: "Hands-on Activity 8: What is Aleatory Poetry?"
---

This week we read about procedural generation and the ways we can use Tracery to make simple grammars to generate randomized content.

# Using Tracery to Make Aleatory Poetry

Tracery is a simple library developed to make the procedural generation of text simple and fun. It was originally written in JavaScript, so you can use it on a website in addition to anywhere else you might want to generate text (you can even use Tracery to generate randomized dialogue in Twine games).

Tracery uses a JSON file to define a hash describing the generation of text. Each JSON hash must contain a key called `origin`, which tells Tracery to start generating at that point. So, a basic Tracery grammar would be:

~~~json
{
	"origin": "Hello"
}
~~~

Every time you run this bot, it will just say "Hello" to you, because Tracery accesses the `origin` key, sees it has no randomness defined in it, and returns "Hello" to us. So, while we are now generating sentences using a computer (!), they aren't very interesting.

In Tracery, we can use a special syntax to reference other keys in our JSON hash, which is called a "grammar" in Tracery. Say we wanted to greet the user with a name. We could update our grammar to read:

~~~json
{
	"origin": "Hello, #name#.",
	"name": "dear reader"
}
~~~

Now, whenever we run our bot, it will produce "Hello, dear reader," because Tracery substitutes the contents of the key, if it exists, for any text between octothorpes (`#`). So, `#name#` causes Tracery to check that the grammar has a key named `name` (which it does) and return the contents of that key (which is `dear reader`). The result we get is not much better than what we had previously, but we are making progress. *Note*; If we were to run our bot before we defined the `name` key, it would produce "Hello, #name#." because the JSON key is not defined. This can help debug problems you may have later.

Let's make some actual aleatory poetry, now. We can make our bot choose a different name for the reader each time we run it with the following grammar:

~~~json
{
	"origin": "Hello, #name#.",
	"name": ["dear reader", "valued friend", "loyal minion", "weary traveller"]
}
~~~

By changing the `name` key to a list, we tell Tracery we want it to choose one of the values at random from that list. Now, when we run our bot, it might say "Hello, dear reader" but it might also say "Hello, loyal minion." We won't know until we run it.

We can further chain our rules together. Each entry in our `name` key contains an adjective and a noun, which we could use to our advantage to produce more randomness, if we wanted:

~~~json
{
	"origin": "Hello, #name#.",
	"name": "#adjective# #noun#",
	"adjective": ["dear", "valued", "loyal", "weary"],
	"noun": ["reader", "friend", "minion", "traveller"]
}
~~~

Now we are embedding rules within other rules within our grammar. Tracery goes to `origin`, which sends it to `name`, which further sends it to both `adjective` and `noun`. Each time Tracery encounters a list of data a particular key, it chooses at random from the list.

We can also use lists with different combinations of keys to generate further novelty:

~~~json
{
	"origin": "Hello, #name#.",
	"name": ["#adjective# #noun#", "#adjective#, #adjective# #noun#"],
	"adjective": ["dear", "valued", "loyal", "weary"],
	"noun": ["reader", "friend", "minion", "traveller"]
}
~~~

Now, when Tracery chooses `name`, sometimes it will generate a name composed of one adjective and one noun ("valued reader") and other times it will choose two adjectives and one noun ("valued, weary minion"). It will do this roughly 50% of the time.

If we would like Tracery to be more favorable to one rule over another when choosing from a list, we can repeat it a number of times. For instance,

~~~json
{
	"origin": "Hello, #name#.",
	"name": [
		"#adjective# #noun#",
		"#adjective# #noun#",
		"#adjective# #noun#",
		"#adjective#, #adjective# #noun#"
	],
	"adjective": ["dear", "valued", "loyal", "weary"],
	"noun": ["reader", "friend", "minion", "traveller"]
}
~~~

# Tracery Resources

Here are some more resources for Tracery.

* [Tracery Visual Editor](http://tracery.io/editor/)
	* Not, it doesn't save your work; if you reload, you'll lose your place
* [Visual Tutorial](http://www.crystalcodepalace.com/traceryTut.html)
	* Covers more advanced topics than our chapter
* [Another Tracery Visualizer](https://atduskgreg.github.io/bother/tracery.html)
	* This one is strange to my eyes, but it might help
* [Corpora Repository](https://github.com/dariusk/corpora)
	* A collection of corpora, collections of related data
	* You my have to adapt them, but you can use them for Tracery bots

# Weekly Activity

Make a Tracery grammar that tells a short story that is randomized each time the grammar is run. You may try [a fairy tale](https://libguides.mssu.edu/c.php?g=185298&p=1223898) ([this article](https://malcolmsroundtable.com/2013/06/15/the-bare-bones-structure-of-a-fairy-tale/) provides a good overview of Vladimir Propp's theory of fairy tale structure) or [a fable](https://www.masterclass.com/articles/how-to-write-a-fable-in-5-steps#how-to-write-a-fable-in-5-steps), as those are formulaic, easy-to-adapt story structures.

Post the Tracery grammar as a site on Jekyll (or just include the JSON file in a blog post on your site).

As with every exercise in this course, it is less important that you finish something as that you attempt to produce something. I am interested in seeing what you come up with!
