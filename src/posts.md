---
layout: default
title: Posts
permalink: /posts/
---

# Posts Page

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>

<hr />

{:style="text-align:center"}
[Return to Home](/)