## Meetings

This section contains each action that can be performed on surveys via the
Meetings API including an example script and request as well as the
associated endpoint.

### Get a list of all meetings

    GET /api/meetings

[View this endpoint in the browser](https://legislative-twitter-dev.herokuapp.com/api/meetings)

#### Example Request

{% highlight bash %}
$ curl -i -H 'Accept: application/vnd.troycitycouncil.v1+json' \
  https://legislative-twitter-dev.herokuapp.com/api/meetings
{% endhighlight %}

#### Response
{% highlight http %}
HTTP/1.1 200 OK
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Status: 200 OK
Cache-Control: max-age=0, private, must-revalidate
Etag: W/"058198503425495b4e67e99db1ae475d"
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Runtime: 0.027177
X-Request-Id: db70f657-d4a6-46b2-8d9f-4c407fe6863c
Date: Fri, 10 Apr 2015 15:28:41 GMT
X-Powered-By: Phusion Passenger 5.0.4
Server: nginx/1.6.2 + Phusion Passenger 5.0.4
Via: 1.1 vegur
{% endhighlight %}

{% highlight json %}
[
  {
    "id": 2,
    "name": "Finance Committee Meeting on March 23rd, 2015 12:00",
    "date": "2015-03-23 12:00:00 -0400",
    "location": "Suite 5, 433 River Street, Troy, NY 12180",
    "legislation_count": 5,
    "organization": {
      "id": 3,
      "name": "Finance Committee",
      "url": "https://legislative-twitter-dev.herokuapp.com/organizations/3.json"
    },
    "agenda": "https://legislative-twitter-dev.herokuapp.com/meetings/2/agenda.json",
    "minutes": "https://legislative-twitter-dev.herokuapp.com/meetings/2/minutes.json",
    "url": "https://legislative-twitter-dev.herokuapp.com/api/meetings/2"
  },
  {
    "id": 1,
    "name": "Finance Committee Meeting on December 18th, 2014 19:00",
    "date": "2014-12-18 19:00:00 -0500",
    "location": "Suite 5, 433 River Street, Troy, NY 12180",
    "legislation_count": 14,
    "organization": {
      "id": 3,
      "name": "Finance Committee",
      "url": "https://legislative-twitter-dev.herokuapp.com/organizations/3.json"
    },
    "agenda": "https://legislative-twitter-dev.herokuapp.com/meetings/1/agenda.json",
    "minutes": "https://legislative-twitter-dev.herokuapp.com/meetings/1/minutes.json",
    "url": "https://legislative-twitter-dev.herokuapp.com/api/meetings/1"
  },
  ...
]
{% endhighlight %}


### Get a single meeting

    GET /api/meetings/3

[View this endpoint in the browser](https://legislative-twitter-dev.herokuapp.com/api/meetings/3)

#### Example Request

{% highlight bash %}
$ curl -i -H 'Accept: application/vnd.troycitycouncil.v1+json' \
  https://legislative-twitter-dev.herokuapp.com/api/meetings/3
{% endhighlight %}

#### Response

{% highlight http %}

HTTP/1.1 200 OK
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Transfer-Encoding: chunked
Status: 200 OK
Cache-Control: max-age=0, private, must-revalidate
Etag: W/"26896ff16d917ce3f6fdd00db2ceb0e8"
X-Frame-Options: SAMEORIGIN
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Runtime: 0.072665
X-Request-Id: 3f91dcee-461a-46c7-893f-7ce9810fc7fd
Date: Fri, 10 Apr 2015 15:30:05 GMT
X-Powered-By: Phusion Passenger 5.0.4
Server: nginx/1.6.2 + Phusion Passenger 5.0.4
Via: 1.1 vegur

{% endhighlight %}

{% highlight json %}

{
  "id": 3,
  "name": "City Council Meeting on March 30th, 2015 21:00",
  "date": "2015-03-30 21:00:00 -0400",
  "location": "Suite 5, 433 River Street, Troy, NY 12180",
  "created_at": "2015-03-21 19:52:59 -0400",
  "updated_at": "2015-03-25 20:29:39 -0400",
  "legislation_count": 6,
  "organization": {
    "id": 2,
    "name": "City Council",
    "url": "https://legislative-twitter-dev.herokuapp.com/organizations/2.json"
  },
  "agenda": {
    "approved": false,
    "url": "https://legislative-twitter-dev.herokuapp.com/meetings/3/agenda.json"
  },
  "minutes": {
    "approved": false,
    "url": "https://legislative-twitter-dev.herokuapp.com/meetings/3/minutes.json"
  },
  "legislations": [
    {
      "id": 4,
      "title": "Ordinance Amending the 2015 City Budget to Transfer Funds Within the General and Water Fund Budget Lines. (Council President Wiltshire) (At the Request ofthe Administration)",
      "short_title": "Transfer Funds within Water Fund Budget",
      "sponsor": null,
      "url": "https://legislative-twitter-dev.herokuapp.com/api/legislations/4"
    },
    {
      "id": 3,
      "title": "Ordinance Approving Settlement ofTax Certiorari Proceedings fustituted by Bryce Properties LLC on the Assessment Roll ofthe City ofTroy. (Council President Wiltshire) (At the Request ofthe Administration)",
      "short_title": "Tax Certiorari Proceedings of Bryce Properties",
      "sponsor": null,
      "url": "https://legislative-twitter-dev.herokuapp.com/api/legislations/3"
    },
    ...
  ]
}

{% endhighlight %}
