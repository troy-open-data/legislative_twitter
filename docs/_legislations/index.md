## Legislation

This section contains each action that can be performed on surveys via the
Legislation API including an example script and request as well as the
associated endpoint.

### Get a list of all legislation

    GET /api/legislations

[View this endpoint in the browser](https://legislative-twitter-dev.herokuapp.com/api/legislations)

#### Example Request

{% highlight bash %}
$ curl -i -H 'Accept: application/vnd.troycitycouncil.v1+json' \
  https://legislative-twitter-dev.herokuapp.com/api/legislations
{% endhighlight %}

#### Response
{% highlight http %}
HTTP/1.1 200 OK
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Status: 200 OK
Cache-Control: max-age=0, private, must-revalidate
Etag: W/"83154f7133646fd36de8a579b45dd577"
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Runtime: 0.021816
X-Request-Id: 6b07c438-b176-4e1f-8b13-b24cc80136a8
Date: Fri, 10 Apr 2015 08:55:09 GMT
X-Powered-By: Phusion Passenger 5.0.4
Server: nginx/1.6.2 + Phusion Passenger 5.0.4
Via: 1.1 vegur
{% endhighlight %}

{% highlight json %}
[
  {
    "id": 1,
    "legislation_type": "Ordinance",
    "title": "Ordinance Amending Ordinance No. 12 Adopted by the Troy City Council on December 4, 1975; as Amended by Ordinance No.1 Adopted December 15, 1979; as Amended by Ordinance No.1 Adopted December 1, 1981; as Amended by Ordinance No.1 Adopted Aprill4, 1983; as Amended by Ordinance No.1 Adopted April2, 1992; as Amended by Ordinance No.2 Adopted January 19, 1996; as Amended by Ordinance No.3 Adopted January 8, 1998; as Amended by Ordinance No. 15 Adopted December 7, 2000; as Amended by Ordinance No. 1 Adopted November 30, 2006; as Amended by Ordinance No. 3 Adopted November 20, 2012; Which Pursuant to Section 10.06 ofthe City Charter and Section 30-17 ofthe Troy Code o f Ordinances Established a Code o f Rules and Regulations for the Department o f Public Utilities and as Amended to fucrease the Sewer Rate From 65% to 85% ofthe Water Bill Rate. (Council President Wiltshire) (At the Request ofthe Administration)",
    "short_title": "Increase Sewer Rate",
    "body": "Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.",
    "url": "https://legislative-twitter-dev.herokuapp.com/api/legislations/1"
  },
  {
    "id": 3,
    "legislation_type": "Ordinance",
    "title": "Ordinance Approving Settlement ofTax Certiorari Proceedings fustituted by Bryce Properties LLC on the Assessment Roll ofthe City ofTroy. (Council President Wiltshire) (At the Request ofthe Administration)",
    "short_title": "Tax Certiorari Proceedings of Bryce Properties",
    "body": "Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.",
    "url": "https://legislative-twitter-dev.herokuapp.com/api/legislations/3"
  },
  ...
]
{% endhighlight %}

### Get a list of legislation by type

    GET /api/legislations?type=Ordinance

[View this endpoint in the browser](https://legislative-twitter-dev.herokuapp.com/api/legislations?type=Ordinance)
(change the value of `type` to return different surveys).

#### Valid Types

Valid legislation types are **Resolution** and **Ordinance**.

#### Example Request

{% highlight bash %}
$ curl -i -H 'Accept: application/vnd.troycitycouncil.v1+json' \
  https://legislative-twitter-dev.herokuapp.com/api/legislations?type=Ordinance
{% endhighlight %}

#### Response

{% highlight http %}
HTTP/1.1 200 OK
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Status: 200 OK
Cache-Control: max-age=0, private, must-revalidate
Etag: W/"a22e9b5e6dade5c4d810682218147aa2"
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Runtime: 0.008117
X-Request-Id: c31d84a8-41ec-4e37-81dc-d68c1b314456
Date: Fri, 10 Apr 2015 09:01:37 GMT
X-Powered-By: Phusion Passenger 5.0.4
Server: nginx/1.6.2 + Phusion Passenger 5.0.4
Via: 1.1 vegur
{% endhighlight %}

{% highlight json %}
[
  {
    "id": 1,
    "legislation_type": "Ordinance",
    "title": "Ordinance Amending Ordinance No. 12 Adopted by the Troy City Council on December 4, 1975; as Amended by Ordinance No.1 Adopted December 15, 1979; as Amended by Ordinance No.1 Adopted December 1, 1981; as Amended by Ordinance No.1 Adopted Aprill4, 1983; as Amended by Ordinance No.1 Adopted April2, 1992; as Amended by Ordinance No.2 Adopted January 19, 1996; as Amended by Ordinance No.3 Adopted January 8, 1998; as Amended by Ordinance No. 15 Adopted December 7, 2000; as Amended by Ordinance No. 1 Adopted November 30, 2006; as Amended by Ordinance No. 3 Adopted November 20, 2012; Which Pursuant to Section 10.06 ofthe City Charter and Section 30-17 ofthe Troy Code o f Ordinances Established a Code o f Rules and Regulations for the Department o f Public Utilities and as Amended to fucrease the Sewer Rate From 65% to 85% ofthe Water Bill Rate. (Council President Wiltshire) (At the Request ofthe Administration)",
    "short_title": "Increase Sewer Rate",
    "body": "Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.",
    "url": "https://legislative-twitter-dev.herokuapp.com/api/legislations/1"
  },
  {
    "id": 3,
    "legislation_type": "Ordinance",
    "title": "Ordinance Approving Settlement ofTax Certiorari Proceedings fustituted by Bryce Properties LLC on the Assessment Roll ofthe City ofTroy. (Council President Wiltshire) (At the Request ofthe Administration)",
    "short_title": "Tax Certiorari Proceedings of Bryce Properties",
    "body": "Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.",
    "url": "https://legislative-twitter-dev.herokuapp.com/api/legislations/3"
  },
  ...
]
{% endhighlight %}

### Get a single legislation

    GET /api/legislations/3

[View this endpoint in the browser](https://legislative-twitter-dev.herokuapp.com/api/legislations/3)

#### Example Request

{% highlight bash %}
$ curl -i -H 'Accept: application/vnd.troycitycouncil.v1+json' \
  https://legislative-twitter-dev.herokuapp.com/api/legislations/3
{% endhighlight %}

#### Response

{% highlight http %}

HTTP/1.1 200 OK
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Status: 200 OK
Cache-Control: max-age=0, private, must-revalidate
Etag: W/"e6076c520efe05cd26fb30b517bd9c0e"
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Runtime: 0.007213
X-Request-Id: 070bc9d8-4fb0-47f0-89b6-4e0b9dc57b2c
Date: Fri, 10 Apr 2015 09:06:31 GMT
X-Powered-By: Phusion Passenger 5.0.4
Server: nginx/1.6.2 + Phusion Passenger 5.0.4
Via: 1.1 vegur

{% endhighlight %}

{% highlight json %}

{
  "id": 3,
  "legislation_type": "Ordinance",
  "title": "Ordinance Approving Settlement ofTax Certiorari Proceedings fustituted by Bryce Properties LLC on the Assessment Roll ofthe City ofTroy. (Council President Wiltshire) (At the Request ofthe Administration)",
  "short_title": "Tax Certiorari Proceedings of Bryce Properties",
  "body": "Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.",
  "created_at": "2015-03-21 17:57:48 -0400",
  "updated_at": "2015-03-21 17:57:48 -0400"
}

{% endhighlight %}