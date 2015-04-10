## API Metadata (Root Node)

    GET /api

[View this endpoint in the browser](https://legislative-twitter-dev.herokuapp.com/api)

The API root url contains metadata for the Legislative Twitter APIs. This metadata
includes:

* API version number
* links to each contained API


#### Example Request

{% highlight bash %}
$ curl -i -H 'Accept: application/vnd.troycitycouncil.v1+json' \
  https://legislative-twitter-dev.herokuapp.com/api
{% endhighlight %}

#### Response
{% highlight http %}
HTTP/1.1 200 OK
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Status: 200 OK
Cache-Control: max-age=0, private, must-revalidate
Etag: W/"ac7c4fa05a2a3d0df719d07938ebc25e"
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Runtime: 0.005214
X-Request-Id: d729d5bf-91ea-4e7f-be78-1ffec7142db7
Date: Fri, 10 Apr 2015 08:49:05 GMT
X-Powered-By: Phusion Passenger 5.0.4
Server: nginx/1.6.2 + Phusion Passenger 5.0.4
Via: 1.1 vegur
{% endhighlight %}

{% highlight json %}
{
  "api_version": "v1",
  "legislations": "https://legislative-twitter-dev.herokuapp.com/api/legislations",
  "meetings": "https://legislative-twitter-dev.herokuapp.com/api/meetings"
}
{% endhighlight %}