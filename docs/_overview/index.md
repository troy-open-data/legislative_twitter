## Overview

This page contains the overview for the Surveys API. It will discuss topics
such as the anatomy of a basic request, defaults and custom headers used for
versioning and specifying MIME type, and how to use the documentation.

### Anatomy of a Basic Request

Here is an example of a basic request that you might compose to get survey data.

{% highlight bash %}

$ curl -X GET -H 'Accept: application/vnd.troycitycouncil.v1+json' \
  http://legislative-twitter.herokuapp.com/api/legislations?type=Resolution

{% endhighlight %}

In this case, we're getting all the legislation of the Resolution type.
Let's break down this request piece by piece.

#### cURL

`curl` is a tool used to transfer data over a URL. It is widely used (with over
a billion users, [according to the website](http://curl.haxx.se)) and is usually
considered the standard. In this case, we're using `curl` to retrieve Survey API's
JSON response. For more information about how to use `curl`,
[read the docs](http://curl.haxx.se/docs/manpage.html).

#### -X *\<command\>*

The `-X <command>` (or `--request <command>`) tag designates what kind of CRUD request you are making: GET, POST,
PATCH, PUT, or DELETE. The default is GET, so if all you are doing is retrieving
information, this can be left off.

#### -d *\<data\>*

This is the data that we're sending to the Survey application. The `-d <data>`
(or `--data <data>`) tag sends data to the url. We didn't use this option in the
example command, but you will use it with any PUT or PATCH request.

#### -H *\<header\>*

The `-H <header>` (or `--header <header>`) tag sends extra headers to the server.
In this case, we're sending the Accept header of `application/vnd.troycitycouncil.v1+json`.
This is a custom accept header used by Surveys API to explicitly denote the
API version (v1) and the response MIME type (JSON). We strongly recommend to
always explicitly include this Accept header in any app using our data; it will
ensure that any future breaking changes to our API do not affect your application.

#### Endpoints

The URL at the end of the `curl` command corresponds to the API endpoint–keeping
with the spirit of a RESTful API, each resource has a unique endpoint. The
endpoints for different actions are the first item listed in the documentation
for each possible action below (ex. `GET /api/meetings`).

To get all of a type of resources or to create a new resource, go to `https://.../api/meetings`.
To get details of a specific resource, to update a resource, or to delete a
resource, include the resource id in the url: `http://.../api/meetings/3`. To add
parameters (where allowed–see documentation), prefix it with a `?` like so:
`http://.../surveys?name=Survey`.



### Defaults

Surveys sets some defaults for the ease of testing and trying out our API. We
strongly recommend that in your application, you declare these settings explicitly.

#### MIME Type: JSON

All responses have a MIME-type of JSON.

#### Version: v1

All calls default to version 1 of our API in order to allow developers to explore
from the browser. However, we *strongly* recommend that you set this explicitly
in your code with the following Accept header:

    application/vnd.surveys.v1+json

If we every add breaking changes and go up API versions, the new default will
be the current version of the API. If your application does not explicitly
declare an API version, it will stop working.

### Documentation Format

In the following sections, we'll explore the different ways you can interact with
the Surveys API. Each category (*"Meetings"*) contains sections (*"Get a list of
all meetings"*) that correspond to each type of possible request.
Each section contains:

1. the REST verb and request URI
2. an example `curl` request
3. the response headers and body

Please feel free to copy and paste the example request into your terminal to
see how it works!