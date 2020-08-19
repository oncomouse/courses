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

YAML uses a more compressed way of expressing data (called a syntax in computing) but represents the same data. If you don't believe me, [check either the YAML or JSON in this online converter](https://www.json2yaml.com/convert-yaml-to-json).
