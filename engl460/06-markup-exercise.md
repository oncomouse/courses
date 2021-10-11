---
layout: default
title: "Hands-on Activity 7: What is Markup?"
---
This activity will teach you how to edit a webpage in your browser, so you can start experimenting with not only your own webpages but how other web pages work (it's also useful for getting around badly coded paywals, but you didn't hear that from me).

Then, you will be asked to explore, in more depth, some advanced HTML tags.

## Editing a Website in Your Browser Using Developer Tools

Today, all serious web browsers ship with a suite of **developer tools** (Internet Explorer also presumably ships with developer tools, but don't use Internet Explorer for anything), which allow web developers, such as you, to test, configure, and diagnose problems with a website as they are building. The developer tools in your browser are your best friend as you start to work more on the design and content of your website.

Please take a few minutes to go through [this tutorial that covers using developer tools in Google Chrome](https://developers.google.com/web/tools/chrome-devtools/dom). The tools are essentially the same on Mozilla Firefox, so if you prefer Firefox (which is a better, more secure browser, anyway), that is fine. Safari has a suite of developer tools, too, but I am more familiar with the ones in Firefox and Chrome (which copied the interface from Firefox), so I would recommend one of those two browsers in this class.

Pretty neat, huh? The developer tools let's you edit your site's HTML in the browser, so you can see what certain changes will look like. While not as guaranteed to work as actually editing your Jekyll blog, it has the advantage of not having to wait for the site to re-build on GitHub Pages.

You will want to get familiar with the developer tools as you work on this hands-on activity.

![An animated GIF illustrating the use of Firefox's Developer Tools](/courses/engl460/images/markup-devtools.gif)
{:.text-center}

## The HTML `<table>`

HTML is much better at formatting tabular data than Markdown (which is possible, though it varies between implementations of Markdown and is often finicky). The tag for tabular data is `<table>`. HTML further divides the table into a heading and a body, which is meant to differentiate between things like column labels and the data in the table. Table data can be presented in rows using the `<tr>` tag and further divided into cells using `<th>` for headings and `<td>` for cells (it stands for "**t**able **d**ivision").

So, we can format a table like this:

~~~html
<table>
	<thead>
		<tr>
			<th>Month</th>
			<th>Earnings</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>January</td>
			<td>$12,000.00</td>
		</tr>
		<tr>
			<td>February</td>
			<td>$14,512.51</td>
		</tr>
	</tbody>
</table>
~~~

Which produces:

<table>
	<thead>
		<tr>
			<th>Month</th>
			<th>Earnings</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>January</td>
			<td>$12,000.00</td>
		</tr>
		<tr>
			<td>February</td>
			<td>$14,512.51</td>
		</tr>
	</tbody>
</table>

## Formatting Code

How can you show formatted text inside of an HTML document? For instance, [consider this example Tracery bot](./06-example.json). If we just pasted the code into HTML, like so:

~~~html
{
	"origin": [
		"Baa, baa, #color# sheep.\nHave you any wool?\nYes, sir. Yes, sir, #bag#"
	],
	"color": [
		"almond",
		"antique brass",
		"apricot",
		"aquamarine",
		"asparagus",
		"atomic tangerine",
		"banana mania",
		"beaver",
		"bittersweet",
		"black",
		"blue",
		"blue bell",
		"blue green",
		"blue violet",
		"blush",
		"brick red",
		"brown",
		"burnt orange",
		"burnt sienna",
		"cadet blue",
		"canary",
		"caribbean green",
		"carnation pink",
		"cerise",
		"cerulean",
		"chestnut",
		"copper",
		"cornflower",
		"cotton candy",
		"dandelion",
		"denim",
		"desert sand",
		"eggplant",
		"electric lime",
		"fern",
		"forest green",
		"fuchsia",
		"fuzzy wuzzy",
		"gold",
		"goldenrod",
		"granny smith apple",
		"gray",
		"green",
		"green yellow",
		"hot magenta",
		"inchworm",
		"indigo",
		"jazzberry jam",
		"jungle green",
		"laser lemon",
		"lavender",
		"macaroni and cheese",
		"magenta",
		"mahogany",
		"manatee",
		"mango tango",
		"maroon",
		"mauvelous",
		"melon",
		"midnight blue",
		"mountain meadow",
		"navy blue",
		"neon carrot",
		"olive green",
		"orange",
		"orchid",
		"outer space",
		"outrageous orange",
		"pacific blue",
		"peach",
		"periwinkle",
		"piggy pink",
		"pine green",
		"pink flamingo",
		"pink sherbert",
		"plum",
		"purple heart",
		"purple mountain's majesty",
		"purple pizzazz",
		"radical red",
		"raw sienna",
		"razzle dazzle rose",
		"razzmatazz",
		"red",
		"red orange",
		"red violet",
		"robin's egg blue",
		"royal purple",
		"salmon",
		"scarlet",
		"screamin' green",
		"sea green",
		"sepia",
		"shadow",
		"shamrock",
		"shocking pink",
		"silver",
		"sky blue",
		"spring green",
		"sunglow",
		"sunset orange",
		"tan",
		"tickle me pink",
		"timberwolf",
		"tropical rain forest",
		"tumbleweed",
		"turquoise blue",
		"unmellow yellow",
		"violet",
		"violet red",
		"vivid tangerine",
		"vivid violet",
		"white",
		"wild blue yonder",
		"wild strawberry",
		"wild watermelon",
		"wisteria",
		"yellow",
		"yellow green",
		"yellow orange"
	],
	"bag": [
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"four bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"five bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#"
	],
	"owner": ["my #thing#", "the #thing#"],
	"owner-last": [
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#"
	],
	"thing": [
		"master",
		"dame",
		"dog",
		"friend",
		"neighbor",
		"boy",
		"girl",
		"bird"
	],
    "street": [
        "lane",
        "street",
        "bog",
        "alley",
        "circle",
        "court"
    ]
}
~~~

We would get:

{
	"origin": [
		"Baa, baa, #color# sheep.\nHave you any wool?\nYes, sir. Yes, sir, #bag#"
	],
	"color": [
		"almond",
		"antique brass",
		"apricot",
		"aquamarine",
		"asparagus",
		"atomic tangerine",
		"banana mania",
		"beaver",
		"bittersweet",
		"black",
		"blue",
		"blue bell",
		"blue green",
		"blue violet",
		"blush",
		"brick red",
		"brown",
		"burnt orange",
		"burnt sienna",
		"cadet blue",
		"canary",
		"caribbean green",
		"carnation pink",
		"cerise",
		"cerulean",
		"chestnut",
		"copper",
		"cornflower",
		"cotton candy",
		"dandelion",
		"denim",
		"desert sand",
		"eggplant",
		"electric lime",
		"fern",
		"forest green",
		"fuchsia",
		"fuzzy wuzzy",
		"gold",
		"goldenrod",
		"granny smith apple",
		"gray",
		"green",
		"green yellow",
		"hot magenta",
		"inchworm",
		"indigo",
		"jazzberry jam",
		"jungle green",
		"laser lemon",
		"lavender",
		"macaroni and cheese",
		"magenta",
		"mahogany",
		"manatee",
		"mango tango",
		"maroon",
		"mauvelous",
		"melon",
		"midnight blue",
		"mountain meadow",
		"navy blue",
		"neon carrot",
		"olive green",
		"orange",
		"orchid",
		"outer space",
		"outrageous orange",
		"pacific blue",
		"peach",
		"periwinkle",
		"piggy pink",
		"pine green",
		"pink flamingo",
		"pink sherbert",
		"plum",
		"purple heart",
		"purple mountain's majesty",
		"purple pizzazz",
		"radical red",
		"raw sienna",
		"razzle dazzle rose",
		"razzmatazz",
		"red",
		"red orange",
		"red violet",
		"robin's egg blue",
		"royal purple",
		"salmon",
		"scarlet",
		"screamin' green",
		"sea green",
		"sepia",
		"shadow",
		"shamrock",
		"shocking pink",
		"silver",
		"sky blue",
		"spring green",
		"sunglow",
		"sunset orange",
		"tan",
		"tickle me pink",
		"timberwolf",
		"tropical rain forest",
		"tumbleweed",
		"turquoise blue",
		"unmellow yellow",
		"violet",
		"violet red",
		"vivid tangerine",
		"vivid violet",
		"white",
		"wild blue yonder",
		"wild strawberry",
		"wild watermelon",
		"wisteria",
		"yellow",
		"yellow green",
		"yellow orange"
	],
	"bag": [
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"four bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"five bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#"
	],
	"owner": ["my #thing#", "the #thing#"],
	"owner-last": [
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#"
	],
	"thing": [
		"master",
		"dame",
		"dog",
		"friend",
		"neighbor",
		"boy",
		"girl",
		"bird"
	],
    "street": [
        "lane",
        "street",
        "bog",
        "alley",
        "circle",
        "court"
    ]
}

Which is technically our JSON document, but it's not very readable. HTML has a `<code>` tag for formatting code, so we could try:

~~~html
<code>
{
	"origin": [
		"Baa, baa, #color# sheep.\nHave you any wool?\nYes, sir. Yes, sir, #bag#"
	],
	"color": [
		"almond",
		"antique brass",
		"apricot",
		"aquamarine",
		"asparagus",
		"atomic tangerine",
		"banana mania",
		"beaver",
		"bittersweet",
		"black",
		"blue",
		"blue bell",
		"blue green",
		"blue violet",
		"blush",
		"brick red",
		"brown",
		"burnt orange",
		"burnt sienna",
		"cadet blue",
		"canary",
		"caribbean green",
		"carnation pink",
		"cerise",
		"cerulean",
		"chestnut",
		"copper",
		"cornflower",
		"cotton candy",
		"dandelion",
		"denim",
		"desert sand",
		"eggplant",
		"electric lime",
		"fern",
		"forest green",
		"fuchsia",
		"fuzzy wuzzy",
		"gold",
		"goldenrod",
		"granny smith apple",
		"gray",
		"green",
		"green yellow",
		"hot magenta",
		"inchworm",
		"indigo",
		"jazzberry jam",
		"jungle green",
		"laser lemon",
		"lavender",
		"macaroni and cheese",
		"magenta",
		"mahogany",
		"manatee",
		"mango tango",
		"maroon",
		"mauvelous",
		"melon",
		"midnight blue",
		"mountain meadow",
		"navy blue",
		"neon carrot",
		"olive green",
		"orange",
		"orchid",
		"outer space",
		"outrageous orange",
		"pacific blue",
		"peach",
		"periwinkle",
		"piggy pink",
		"pine green",
		"pink flamingo",
		"pink sherbert",
		"plum",
		"purple heart",
		"purple mountain's majesty",
		"purple pizzazz",
		"radical red",
		"raw sienna",
		"razzle dazzle rose",
		"razzmatazz",
		"red",
		"red orange",
		"red violet",
		"robin's egg blue",
		"royal purple",
		"salmon",
		"scarlet",
		"screamin' green",
		"sea green",
		"sepia",
		"shadow",
		"shamrock",
		"shocking pink",
		"silver",
		"sky blue",
		"spring green",
		"sunglow",
		"sunset orange",
		"tan",
		"tickle me pink",
		"timberwolf",
		"tropical rain forest",
		"tumbleweed",
		"turquoise blue",
		"unmellow yellow",
		"violet",
		"violet red",
		"vivid tangerine",
		"vivid violet",
		"white",
		"wild blue yonder",
		"wild strawberry",
		"wild watermelon",
		"wisteria",
		"yellow",
		"yellow green",
		"yellow orange"
	],
	"bag": [
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"four bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"five bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#"
	],
	"owner": ["my #thing#", "the #thing#"],
	"owner-last": [
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#"
	],
	"thing": [
		"master",
		"dame",
		"dog",
		"friend",
		"neighbor",
		"boy",
		"girl",
		"bird"
	],
    "street": [
        "lane",
        "street",
        "bog",
        "alley",
        "circle",
        "court"
    ]
}
</code>
~~~

But that just produces:

<code>
{
	"origin": [
		"Baa, baa, #color# sheep.\nHave you any wool?\nYes, sir. Yes, sir, #bag#"
	],
	"color": [
		"almond",
		"antique brass",
		"apricot",
		"aquamarine",
		"asparagus",
		"atomic tangerine",
		"banana mania",
		"beaver",
		"bittersweet",
		"black",
		"blue",
		"blue bell",
		"blue green",
		"blue violet",
		"blush",
		"brick red",
		"brown",
		"burnt orange",
		"burnt sienna",
		"cadet blue",
		"canary",
		"caribbean green",
		"carnation pink",
		"cerise",
		"cerulean",
		"chestnut",
		"copper",
		"cornflower",
		"cotton candy",
		"dandelion",
		"denim",
		"desert sand",
		"eggplant",
		"electric lime",
		"fern",
		"forest green",
		"fuchsia",
		"fuzzy wuzzy",
		"gold",
		"goldenrod",
		"granny smith apple",
		"gray",
		"green",
		"green yellow",
		"hot magenta",
		"inchworm",
		"indigo",
		"jazzberry jam",
		"jungle green",
		"laser lemon",
		"lavender",
		"macaroni and cheese",
		"magenta",
		"mahogany",
		"manatee",
		"mango tango",
		"maroon",
		"mauvelous",
		"melon",
		"midnight blue",
		"mountain meadow",
		"navy blue",
		"neon carrot",
		"olive green",
		"orange",
		"orchid",
		"outer space",
		"outrageous orange",
		"pacific blue",
		"peach",
		"periwinkle",
		"piggy pink",
		"pine green",
		"pink flamingo",
		"pink sherbert",
		"plum",
		"purple heart",
		"purple mountain's majesty",
		"purple pizzazz",
		"radical red",
		"raw sienna",
		"razzle dazzle rose",
		"razzmatazz",
		"red",
		"red orange",
		"red violet",
		"robin's egg blue",
		"royal purple",
		"salmon",
		"scarlet",
		"screamin' green",
		"sea green",
		"sepia",
		"shadow",
		"shamrock",
		"shocking pink",
		"silver",
		"sky blue",
		"spring green",
		"sunglow",
		"sunset orange",
		"tan",
		"tickle me pink",
		"timberwolf",
		"tropical rain forest",
		"tumbleweed",
		"turquoise blue",
		"unmellow yellow",
		"violet",
		"violet red",
		"vivid tangerine",
		"vivid violet",
		"white",
		"wild blue yonder",
		"wild strawberry",
		"wild watermelon",
		"wisteria",
		"yellow",
		"yellow green",
		"yellow orange"
	],
	"bag": [
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"four bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"five bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#"
	],
	"owner": ["my #thing#", "the #thing#"],
	"owner-last": [
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#"
	],
	"thing": [
		"master",
		"dame",
		"dog",
		"friend",
		"neighbor",
		"boy",
		"girl",
		"bird"
	],
    "street": [
        "lane",
        "street",
        "bog",
        "alley",
        "circle",
        "court"
    ]
}
</code>

Which is better looking but still removes all of our careful formatting.

Our formatting is being messed up because HTML treats all spacing characters (tabs, spaces, and newlines) as a single space, so if I were to type 5 tabs, a newline, and another 5 tabs, HTML would convert it to " ".

If we want to preserve our formatting, we have to tell HTML to stop doing that. We can do that by using the `<pre>` tag, which is short for "preformatted text" or HTML-speak for "leave the spaces alone."

So, now we can type

~~~html
<pre><code>{
	"origin": [
		"Baa, baa, #color# sheep.\nHave you any wool?\nYes, sir. Yes, sir, #bag#"
	],
	"color": [
		"almond",
		"antique brass",
		"apricot",
		"aquamarine",
		"asparagus",
		"atomic tangerine",
		"banana mania",
		"beaver",
		"bittersweet",
		"black",
		"blue",
		"blue bell",
		"blue green",
		"blue violet",
		"blush",
		"brick red",
		"brown",
		"burnt orange",
		"burnt sienna",
		"cadet blue",
		"canary",
		"caribbean green",
		"carnation pink",
		"cerise",
		"cerulean",
		"chestnut",
		"copper",
		"cornflower",
		"cotton candy",
		"dandelion",
		"denim",
		"desert sand",
		"eggplant",
		"electric lime",
		"fern",
		"forest green",
		"fuchsia",
		"fuzzy wuzzy",
		"gold",
		"goldenrod",
		"granny smith apple",
		"gray",
		"green",
		"green yellow",
		"hot magenta",
		"inchworm",
		"indigo",
		"jazzberry jam",
		"jungle green",
		"laser lemon",
		"lavender",
		"macaroni and cheese",
		"magenta",
		"mahogany",
		"manatee",
		"mango tango",
		"maroon",
		"mauvelous",
		"melon",
		"midnight blue",
		"mountain meadow",
		"navy blue",
		"neon carrot",
		"olive green",
		"orange",
		"orchid",
		"outer space",
		"outrageous orange",
		"pacific blue",
		"peach",
		"periwinkle",
		"piggy pink",
		"pine green",
		"pink flamingo",
		"pink sherbert",
		"plum",
		"purple heart",
		"purple mountain's majesty",
		"purple pizzazz",
		"radical red",
		"raw sienna",
		"razzle dazzle rose",
		"razzmatazz",
		"red",
		"red orange",
		"red violet",
		"robin's egg blue",
		"royal purple",
		"salmon",
		"scarlet",
		"screamin' green",
		"sea green",
		"sepia",
		"shadow",
		"shamrock",
		"shocking pink",
		"silver",
		"sky blue",
		"spring green",
		"sunglow",
		"sunset orange",
		"tan",
		"tickle me pink",
		"timberwolf",
		"tropical rain forest",
		"tumbleweed",
		"turquoise blue",
		"unmellow yellow",
		"violet",
		"violet red",
		"vivid tangerine",
		"vivid violet",
		"white",
		"wild blue yonder",
		"wild strawberry",
		"wild watermelon",
		"wisteria",
		"yellow",
		"yellow green",
		"yellow orange"
	],
	"bag": [
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"four bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"five bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#"
	],
	"owner": ["my #thing#", "the #thing#"],
	"owner-last": [
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#"
	],
	"thing": [
		"master",
		"dame",
		"dog",
		"friend",
		"neighbor",
		"boy",
		"girl",
		"bird"
	],
    "street": [
        "lane",
        "street",
        "bog",
        "alley",
        "circle",
        "court"
    ]
}</pre></code>
~~~

Which would produce:

<pre><code>{
	"origin": [
		"Baa, baa, #color# sheep.\nHave you any wool?\nYes, sir. Yes, sir, #bag#"
	],
	"color": [
		"almond",
		"antique brass",
		"apricot",
		"aquamarine",
		"asparagus",
		"atomic tangerine",
		"banana mania",
		"beaver",
		"bittersweet",
		"black",
		"blue",
		"blue bell",
		"blue green",
		"blue violet",
		"blush",
		"brick red",
		"brown",
		"burnt orange",
		"burnt sienna",
		"cadet blue",
		"canary",
		"caribbean green",
		"carnation pink",
		"cerise",
		"cerulean",
		"chestnut",
		"copper",
		"cornflower",
		"cotton candy",
		"dandelion",
		"denim",
		"desert sand",
		"eggplant",
		"electric lime",
		"fern",
		"forest green",
		"fuchsia",
		"fuzzy wuzzy",
		"gold",
		"goldenrod",
		"granny smith apple",
		"gray",
		"green",
		"green yellow",
		"hot magenta",
		"inchworm",
		"indigo",
		"jazzberry jam",
		"jungle green",
		"laser lemon",
		"lavender",
		"macaroni and cheese",
		"magenta",
		"mahogany",
		"manatee",
		"mango tango",
		"maroon",
		"mauvelous",
		"melon",
		"midnight blue",
		"mountain meadow",
		"navy blue",
		"neon carrot",
		"olive green",
		"orange",
		"orchid",
		"outer space",
		"outrageous orange",
		"pacific blue",
		"peach",
		"periwinkle",
		"piggy pink",
		"pine green",
		"pink flamingo",
		"pink sherbert",
		"plum",
		"purple heart",
		"purple mountain's majesty",
		"purple pizzazz",
		"radical red",
		"raw sienna",
		"razzle dazzle rose",
		"razzmatazz",
		"red",
		"red orange",
		"red violet",
		"robin's egg blue",
		"royal purple",
		"salmon",
		"scarlet",
		"screamin' green",
		"sea green",
		"sepia",
		"shadow",
		"shamrock",
		"shocking pink",
		"silver",
		"sky blue",
		"spring green",
		"sunglow",
		"sunset orange",
		"tan",
		"tickle me pink",
		"timberwolf",
		"tropical rain forest",
		"tumbleweed",
		"turquoise blue",
		"unmellow yellow",
		"violet",
		"violet red",
		"vivid tangerine",
		"vivid violet",
		"white",
		"wild blue yonder",
		"wild strawberry",
		"wild watermelon",
		"wisteria",
		"yellow",
		"yellow green",
		"yellow orange"
	],
	"bag": [
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"three bags full.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"four bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#",
		"five bags full.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nOne for #owner#.\nAnd one for #owner-last#"
	],
	"owner": ["my #thing#", "the #thing#"],
	"owner-last": [
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#",
		"the little #thing# who lives down the #street#"
	],
	"thing": [
		"master",
		"dame",
		"dog",
		"friend",
		"neighbor",
		"boy",
		"girl",
		"bird"
	],
    "street": [
        "lane",
        "street",
        "bog",
        "alley",
        "circle",
        "court"
    ]
}</code></pre>

So, we have to use the `<pre><code>` tags in combination to produce properly formatted code blocks in HTML, if we want to share our code.

### A Note on [HTML inside HTML](https://knowyourmeme.com/memes/xzibit-yo-dawg)

If you want to use `<pre><code>` to format HTML inside of HTML, you have to do one more thing. Because HTML is a good little worker, it will process all the `<` and `>` symbols inside your code block into actual HTML tags, even though they are where they are. To fix that, we have to use what are called "HTML special characters."

There are lots of HTML special characters, but the two we are concerned with here are `&lt;` and `&gt;`, which produce the `<` and `>` symbols without HTML thinking they are tags.

So, to post HTML code inside an HTML document, we would have to do a find and replace on every `<` to `&lt;` and every `>` to `&gt;`, which is kind of a bummer. Thankfully, Markdown will do that for us, but, nonetheless, in HTML, if we wanted to convert the following to a code block:

~~~html
<p><strong>Hello!</strong></p>
~~~

If we tried:

~~~html
<pre><code><p><strong>Hello!</strong></p></code></pre>
~~~

We would get:

<pre><code><p><strong>Hello!</strong></p></code></pre>

Because HTML converts the `<p>` and the `<strong>` into the HTML tags instead of what we want.

Instead, we would have to type:

~~~html
<pre><code>&lt;p&gt;&lt;strong&gt;Hello!&lt;/strong&gt;&lt;/p&gt;</code></pre>
~~~

Which will produce:

<pre><code>&lt;p&gt;&lt;strong&gt;Hello!&lt;/strong&gt;&lt;/p&gt;</code></pre>

## Your Challenge

Produce an HTML file containing two elements:

1. Convert some of the data you produced in ["Data"](https://oncomouse.github.io/courses/engl460/03-data-exercise.html) into a `<table>`. Remember that lists are often best for representing as tabular data.
1. Convert the JSON file you made in ["Aleatory Poetry"](https://oncomouse.github.io/courses/engl460/05-chance-exercise.html) into a `<pre><code>` block.

You can check your work as you write your HTML using VS Code's error checking functions and also by opening the file in your web browser. It will not be very well formatted at this point, but that's okay. We're just getting started with HTML.

Turn in the HTML file you produced along with your lab report on Canvas.
