---
layout: post
title:  "Anasha example post"
date:  2015-04-10 21:39:33˚
category: Watercooler
author: Anasha
tags: politics community
---

Hello Anasha! Here is an example of a post for the jekyll blog. 

As you can see, it's all written in [Markdown](http://kramdown.gettalong.org), 
which I'm sure you're familiar with through Reddit and other sites.

## Front Matter

If you look at the sourcecode, you'll see something that looks like this:

{% highlight markdown %}

---
layout: post
title:  "Anasha example post"
date:  2015-04-10 21:39:33˚
category: Watercooler
author: Anasha
tags: politics community
---

{% endhighlight %}

This is called the "front matter"; it sets the metadata for the post. 
You'll want to keep the `layout: post` unless you have a reason for it.
A title is required, but put whatever you want. A date is also required,
and I'd suggest updating it right before publishing. 

The category is the
top-level category for the post. I would suggest keeping yours on 
"Watercooler" unless you're getting enought posts in a category for a new
one. I'd like to keep the category number pretty low. Right now,
we have Watercooler, Meta, and Engineering.

Always set the author option; it defaults to me since I assume I'll be 
posting more.

Tags can be whatever you want them to be. That's an optional field. 

## Beyond markdown

This is a bit more complicated, but jekyll does more than just 
markdown. It uses a templating language called Liquid, and with that you
can get some cool data. For example, here are all the site blog posts:

{% for post in site.category.blog %}
* [{{ post.title }}]({{ post.url }}) *{{post.author}}*
{% endfor %}

Unlike Reddit, you can also insert images and highlighted code blocks as well.
If you'd like to do this in your post, let me know or read the 
[jekyll documentation](http://jekyllrb.com/docs/).

## Publishing

In order to publish a post, just prepend a date (see the _posts folder for 
examples) and drag it over to the _posts folder. It should be published
immediately.

Enjoy!
