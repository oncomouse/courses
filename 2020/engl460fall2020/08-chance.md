---
layout: default
title: "ENGL 460 – What is Aleatory Poetry?"
---

In this chapter, we're going to learn about a process called "aleatory poetry," which is the process of using chance to generate text. This process first emerges in experimental writing circles but moves to more mainstream applications as [procedural generation](https://en.wikipedia.org/wiki/Procedural_generation) becomes used in computing applications such as video games and chat bots.

In this chapter, we'll discuss some applications of aleatory poetry and learn how to use this technique in our own web projects.

# A Definition

# Randomness

The dada artist Tristan Tzara, in one of his several manifestos for the absurdist movement, included a section entitled "To Make a Dadaist Poem." It offers some of the first instructions for what Richard Lanham would call aleatory poetry. Here are Tzara's instructions:

> Take a newspaper.  
> Take some scissors.  
> Choose from this paper an article the length you want to make your poem.  
> Cut out the article.  
> Next carefully cut out each of the words that make up this article and put them all in a bag.  
> Shake gently.  
> Next take out each cutting one after the other.  
> Copy conscientiously in the order in which they left the bag.  
> The poem will resemble you.  
> And there you are—an infinitely original author of charming sensibility, even though unappreciated by the vulgar herd.  
{:.text-gray-dark.border-left-0.pl-4.pr-0}

Tzara's instructions are absurd, and, according	to [William S. Burroughs](https://www.writing.upenn.edu/~afilreis/88v/burroughs-cutup.html), another author obsessed with randomness in writing, caused a riot at a Surrealist rally and got Tzara officially barred from that group of experimental artists.

But Tzara's technique continued to be employed by experimental artists throughout the 20th century. In the 21st, randomizing text becomes easier and easier thanks to the computer, which can be made to quickly generate vast quantities of text based on various [digital random number generation algorithms](https://en.wikipedia.org/wiki/Random_number_generation). This technique is interesting because, where hypertext allows the reader to generate a path through the text and thus generate through reading a particular, novel text, aleatory poetry allows for the creation of novel texts based on chance and randomness.

If hypertext is, at its core, basically a [Choose Your Own Adventure Novel](https://en.wikipedia.org/wiki/Choose_Your_Own_Adventure), you can think of aleatory poetry as a game of computerized [Mad Libs](https://en.wikipedia.org/wiki/Mad_Libs).

Mentioning both hypertext and aleatory poetry in the context of game playing is especially important, as many games make use of both tools as part of their story-telling. Where, as we saw last week, game designers use Twine to map out a branching story that a user might move through in order to check for glitches in the story structure, procedurally-generated content is used in many video games to increase the reality-effect of games: by making NPCs have slightly different conversations each time a player encounters them, to generating quests and even whole planets new each time a user visits.

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

# Using Tracery on Jekyll

If you'd like to use Tracery on your Jekyll site or use Jekyll to test a Tracery grammar for using Twine or somewhere else (see below), you can! Create a file in your repository called `_layouts/tracery.html` and add the following to that file:

{% raw %}
~~~html
---
layout: default
---
<div class="tracery">
  <p class="tracery_output"></p>
  <button class="tracery_generate">Generate Again</button>
</div>
<script type="application/json" id="grammar">
{{ content }}
</script>
<script src="https://cdn.jsdelivr.net/npm/cash-dom@8.0.0/dist/cash.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/oncomouse/tracery@1.0.1/tracery.min.js"></script>
<script>
  $(function() {
    function generateTracery(grammar) {
      return function() {
        $('.tracery_output').text(grammar.flatten('#origin#'))
      }
    }
    var grammar = tracery.createGrammar(JSON.parse($('#grammar').text()));
    generateTracery(grammar)();
    $('.tracery_generate').on('click', generateTracery(grammar));
  })
</script>
~~~
{% endraw %}

Now, you can create an html file (it has to be an html) that contains your grammar and set `tracery` as the layout. So, I could create `tracery-example.html` on my Jekyll site and would include the following:

~~~html
---
layout: tracery
---
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

Loading that page will present some very basic Tracery controls and output. You can style `.tracery`, `.tracery_output`, and `.tracery_generate` to make the appearance fancy, if you want.

**Note**: If you're wondering why the extension for `tracery-example` is `.html` instead of `.json`, I'm very proud of you for noticing that! We have to do that because we are technically tricking Jekyll into display JSON data as an HTML page. It is a bit of a hack, but it will work because the `_layouts/tracery.html` file loads the content of the file as JSON.

# Using Cheap Bots Done Quick to Host on Twitter
