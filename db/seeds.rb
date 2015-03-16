# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

statuses = Status.create([{ title: 'Passed' },
                          { title: 'Signed Into Law' },
                          { title: 'Amended in Session' },
                          { title: 'Tabled' },
                          { title: 'Vetoed' },
                          { title: 'Veto Override' },
                          { title: 'Rejected' },
                          { title: 'Revised out of Session' },
                          { title: 'Withdrawn' }])

organizations = Organization.create([{ level: 0,
                                       name: 'Mayor Lou Rosamilia' },
                                     { level: 1,
                                       name: 'City Council' },
                                     { level: 2,
                                       name: 'Finance Committee' }])

legislations = Legislation.create([ { legislation_type: 'Ordinance',
                                      title: 'Ordinance Amending Ordinance No. 12 Adopted by the Troy City Council on December 4, 1975; as Amended by Ordinance No.1 Adopted December 15, 1979; as Amended by Ordinance No.1 Adopted December 1, 1981; as Amended by Ordinance No.1 Adopted Aprill4, 1983; as Amended by Ordinance No.1 Adopted April2, 1992; as Amended by Ordinance No.2 Adopted January 19, 1996; as Amended by Ordinance No.3 Adopted January 8, 1998; as Amended by Ordinance No. 15 Adopted December 7, 2000; as Amended by Ordinance No. 1 Adopted November 30, 2006; as Amended by Ordinance No. 3 Adopted November 20, 2012; Which Pursuant to Section 10.06 ofthe City Charter and Section 30-17 ofthe Troy Code o f Ordinances Established a Code o f Rules and Regulations for the Department o f Public Utilities and as Amended to fucrease the Sewer Rate From 65% to 85% ofthe Water Bill Rate. (Council President Wiltshire) (At the Request ofthe Administration)',
                                      short_title: 'Increase Sewer Rate',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Ordinance',
                                      title: 'Ordinance Authorizing the Mayor to Enter into a Purchase and Sale Agreement with the Catholic Charities Housing Office (CCHO) for the Purpose o f Selling Properties Located at 3349 6th A venue and 391 1st Street, Troy, New York. (Council President Wiltshire ) (At the Request ofthe Administration)',
                                      short_title: 'Sell Properties to CCHO',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Ordinance',
                                      title: 'Ordinance Approving Settlement ofTax Certiorari Proceedings fustituted by Bryce Properties LLC on the Assessment Roll ofthe City ofTroy. (Council President Wiltshire) (At the Request ofthe Administration)',
                                      short_title: 'Tax Certiorari Proceedings of Bryce Properties',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Ordinance',
                                      title: 'Ordinance Amending the 2015 City Budget to Transfer Funds Within the General and Water Fund Budget Lines. (Council President Wiltshire) (At the Request ofthe Administration)',
                                      short_title: 'Transfer Funds within Water Fund Budget',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },




                                    { legislation_type: 'Resolution',
                                      title: 'Resolution Amending the Rules ofOrder and Setting the Dates ofthe Regular Monthly Meetings ofthe Troy City Council. (Council President Wiltshire) (At the Request of the Administration)',
                                      short_title: 'Amend Dates of Monthly Meetings',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Repealing Resolutions Pertaining to the 2014 Mayor's Capital Plan that Authorized the Issuance ofSerial Bonds. (Council Member Gordon)",
                                      short_title: 'Repeal Authorization of Serial Bonds',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Appointing Commissioners of Deeds for the City ofTroy. (Council President Wiltshire) (At the Request of the Administration)",
                                      short_title: 'Appoint Commissioner of Deeds',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Authorizing the Mayor to Execute and Enter into an Inter-Municipal Agreement with the Albany Pool Communities. (Council President Wiltshire) (At the Request oft he Administration)",
                                      short_title: 'Authorize Mayor to Enter Agreeement with Albany Pool Community',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Bond Resolution ofthe City ofTroy, New York Authorizing the Issuance of$3,537,411 in Serial Bonds to Finance a Capital Project Described in the Combined Sewer Overflow Long Term Control Plan. (Council President Wiltshire) (At the Request ofthe Administration)",
                                      short_title: 'Issue bonds to fund Sewer Overflow Plan',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Authorizing the Mayor to Execute an Agreement with Rensselaer County Sewer District No. #1 for Utilizing the City's Computerized Water and Sewer Billing and Collection System. (Council President Wiltshire) (At the Request ofthe Administration)",
                                      short_title: 'Execute Agreement with Rensselaer County Sewer District #1',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Authorizing the Mayor to Enter into a Centralized Dispatch of Emergency Services Agreement with Rensselaer County. (Council President Wiltshire) (At the Request ofthe Administration)",
                                      short_title: nil,
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Authorizing the Implementation and Funding of 100% ofDepartment ofHomeland Security's Federal Emergency Management Agency for the Purpose of Stabilizing the Seawall Along the Hudson River. (Council President Wiltshire) (At the Request ofthe Administration)",
                                      short_title: 'Stabilize Seawall along Hudson River',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Authorizing the Mayor to Execute an Agreement with the Rensselaer County STOP DWI and to Appropriate Certain Funds to Help Support the Troy Police Department Cadet Program. (Council President Wiltshire) (At the Request of the Administration)",
                                      short_title: 'Stop DWI and Police Department Cadet Program',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' },

                                    { legislation_type: 'Resolution',
                                      title: "Resolution Requesting State Legislative Member Requests for the Purpose of Securing Funding in the New York State 2015-16 Budget for the Construction ofa new City Courthouse. (Council Member Zalewski)",
                                      short_title: 'Secure Funding for a new City Courthouse',
                                      body: 'Neque purus pede condimentum pretium sollicitudin. Lacus morbi non vestibulum habitasse ante aliquet ad. Ipsum felis aptent aenean quisque et quam. Etiam felis ipsum auctor metus. Magna porta eleifend adipiscing.' }])