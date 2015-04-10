---
layout: post
title:  "API Best Practices"
date:  2015-04-05 21:39:33˚
category: Engineering
tags: API research
---

Writing:

I. Who cares?

- Why am I doing this?
- Why is open data important?
- Why is the API important?

II. Sources

- A lot of information out there
-- lots of self-linking, forked guides, etc.
-- many very well articulated how-to guides
-- transition period, but consensus is clearly emerging
-- Leaders: government sources (Open Data initiative, 18F seems to be leading the pack),
civ companies who value data access (GitHub, Twitter)

III. Guidelines

- Make sure your major use cases are covered
-- bulk download
-- updates
-- reliably delivered

- the API is the UI for a developer, so make it beautiful
-- endpoints make sense
-- RESTful
-- documentation should be thorough, interactive, and well-written

- JSON is king

- do authentication, pagination, error-handling, in an expected way.

- This was said before, but documentation is very, very important.

- Make sure your API is good before deploying. Changing things breaks stuff, and
you don't want a new version too fast.

V. What next

- Next step to API development is to look at other exemplary small cities or
other closeby cities to try to come up with some naming conventions





Research:
Blog post about the research behind API best practices. What are the
absolute minimum requirements and why? What are the naming and access conventions?
What "gotcha's" should I watch for?

Cover open data by other cities in another post.

Clear and sensible API standards, generalized: https://github.com/18f/api-standards

Other resources: http://18f.github.io/API-All-the-X/pages/api_standards

http://18f.github.io/API-All-the-X/pages/best_practices
https://legislative-twitter.herokuapp.com/developer
- Clear documentation
- Examples
- Sample URLs

Bulk download option (priority)

## Good Examples

* GitHub Developer
* Twitter Developer
* Facebook Sandbox
* [National Renewable Energy Laboratory](http://developer.nrel.gov/docs/buildings/standard-work-spec-v1/)

## Further reading

[Best Practices for a Pragmatic RESTful API](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
: A comprehensive overview and list of further resources for API best practices.

[18F API Best Practices](http://18f.github.io/API-All-the-X/pages/best_practices)
: API documentation and communication best practices *(Where should you put the
  documentation? What should the examples look like?)*


[18F API Standards](http://18f.github.io/API-All-the-X/pages/api_standards)
: API development best practices *(What makes a sensible endpoint?
  How should I handle errors?)*

[18F API Release Kit](http://18f.github.io/API-All-the-X/pages/api_release_kit)
: Common tools used to build and distribute APIs

