---
layout: page
title: Features
permalink: /features/
---

This page details what new features are include in each software release.

Please note that the minimum viable product (v1.0.0) has not yet been released,
so this list will be modified as development continues.

*Current Milestone: Building an API*

## v1.0.0

### Scope

Public should be able to search, view, and download legislation, agendas, and
minutes; they should be able to see meetings, organizations, and status. Clerk
should be able to easily generate agendas from legislation as well as perform
any tasks needed to that legislation during the meetings. All content should
be available in both human- and machine-usable formats.

### Milestones

You can find more details about milestone progress [here](https://github.com/leesharma/legislative_twitter/milestones).

Future milestones for this release will include:

* Building an API (current)
* People and votes
* Legislation status updates
* Authentication and administration
* UI beautification
* Pre-launch preparation

Completed milestones:

* Legislation
* PDF Generation
* Organizations and Meetings

### Features

#### General Features
* Heroku build information and links to the edge/stable site now live in the footer
* Side and top navigation now include useful links
* "Admin" toggle helps users visualize the difference between pages for an admin and non-admin
* "Create new" menus in both the side and top navigation
* Links to the meetings, legislations, organizations, and statuses index pages

#### Legislation
* Legislation can be created/edited/destroyed
* Legislation has a short title for display
* All versions of legislation are tracked and stored
* Legislation can have many attachments <1 megabyte and of the jpg, png, or pdf format
* Can download PDF report of the legislation with the option of with or without attachments

#### Meetings
* Meetings can be created/edited/destroyed
* Legislation can be added to a meeting via folios
* Meetings can be started after the meeting start time, which allows taking notes, recording votes, and marking sponsors for each piece of legislation
* Meeting details page shows pertinent details for a meeting, including meta-information (who, where, when) as well as legislation on the docket
* Agendas and minutes can be viewed as an html page or downloaded as a pdf
* Agendas and minutes can be marked as draft or approved, which changes how they appear on the page and on the PDF download

#### Organizations
* Organizations can be created/edited/destroyed
* Meetings on the index page are grouped by organization

#### Statuses
* Statuses can be created/edited/destroyed

#### *Current Milestone: Building an API*

* *REST API that encompasses all application data*
* *API documentation*
* *Development blog*

#### *Next Milestone: People and Voting*

* *People Exist and can be Manipulated*
* *People Sponsor Legislation*
* *People Attend Meetings*
* *People Vote on Legislation in Meetings*