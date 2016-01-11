Admin.create!([
  {fname: "Sample", lname: "Admin", username: nil, email: "admin@admin.com", password: "password", super_admin: false, full_name: "Sample Admin", active: true}
])
Driver.create!([
  {fname: "Ricky", lname: "Bobby", email: "ricky@bobby.com", password_digest: "$2a$10$UapxqVCMQ/tILzPikZLV/OtmxW4/B16xmQ5Q4Ge/5zt4wKI3sGURy", address_line1: "1234 Real Fast Lane", address_line2: "", city: "Philadelphia", state: "PA", zip: "19120", car_type: "Four door", monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, unavailable: nil, accommodate_wheelchair: true, accommodate_aide: true, preferred_contact: nil, phone: "(214) 142-3432", cell: "(234) 232-3523", monday_min: "2000-01-01 08:30:00", monday_max: "2000-01-01 16:30:00", tuesday_min: "2000-01-01 08:30:00", tuesday_max: "2000-01-01 16:30:00", wednesday_min: "2000-01-01 08:30:00", wednesday_max: "2000-01-01 16:30:00", thursday_min: "2000-01-01 08:30:00", thursday_max: "2000-01-01 16:30:00", friday_min: "2000-01-01 08:30:00", friday_max: "2000-01-01 16:30:00", county_preference: ["Chester County", "Delaware County", "Montgomery County", "Philadelphia County", "All"], full_name: "Ricky Bobby", private: nil, confirmed: true, active: true, prefered_contact: "Cell Phone", accommodate_pet: true},
  {fname: "Cal", lname: "Naughton Jr.", email: "cal@naughton.com", password_digest: "$2a$10$5yriX0QPGGkq8UaJghXsqOLrcoyeZ1EiYCAEpIK7bB.nCSqNPPVsO", address_line1: "4321 High Speed Rd", address_line2: "", city: "Talladega", state: "PA", zip: "19323", car_type: "Four door", monday: true, tuesday: false, wednesday: true, thursday: false, friday: true, unavailable: nil, accommodate_wheelchair: false, accommodate_aide: true, preferred_contact: nil, phone: "(231) 423-2234", cell: "(324) 235-3252", monday_min: "2000-01-01 08:30:00", monday_max: "2000-01-01 12:00:00", tuesday_min: nil, tuesday_max: nil, wednesday_min: "2000-01-01 08:30:00", wednesday_max: "2000-01-01 12:00:00", thursday_min: nil, thursday_max: nil, friday_min: "2000-01-01 08:30:00", friday_max: "2000-01-01 12:00:00", county_preference: ["Chester County", "Delaware County", "Montgomery County", "All"], full_name: "Cal Naughton Jr.", private: nil, confirmed: true, active: true, prefered_contact: "Cell Phone", accommodate_pet: true},
  {fname: "Jean", lname: "Girard", email: "jean@girard.com", password_digest: "$2a$10$T1Q5JSgW56HEpgoDj9G1RugbrJN0d40svNlOaRufAJbTgUUk6qNme", address_line1: "4312 Frenchman Rd", address_line2: "", city: "Paris", state: "PA", zip: "12312", car_type: "Two door", monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, unavailable: nil, accommodate_wheelchair: true, accommodate_aide: false, preferred_contact: nil, phone: "(221) 212-3432", cell: "(324) 235-2343", monday_min: "2000-01-01 12:00:00", monday_max: "2000-01-01 16:30:00", tuesday_min: "2000-01-01 12:00:00", tuesday_max: "2000-01-01 16:30:00", wednesday_min: "2000-01-01 12:00:00", wednesday_max: "2000-01-01 16:30:00", thursday_min: "2000-01-01 12:00:00", thursday_max: "2000-01-01 16:30:00", friday_min: "2000-01-01 12:00:00", friday_max: "2000-01-01 16:30:00", county_preference: ["Chester County", "Delaware County", "All"], full_name: "Jean Girard", private: nil, confirmed: true, active: true, prefered_contact: "Cell Phone", accommodate_pet: true}
])
Destination.create!([
  {member_id: 1, name: "Mike Robinson", address_line1: "510 Spring Mill Ave", address_line2: "", city: "Conshohocken", state: "PA", zip: "19428", destination_type: "grocery", destination_other_type: nil, county: "Montgomery County"}
])
Matcher.create!([
  {driver_id: 1, match_num: nil},
  {driver_id: 2, match_num: nil},
  {driver_id: 3, match_num: nil}
])
Member.create!([
  {fname: "George", lname: "Williams", email: "george@williams.com", password_digest: "$2a$10$D0zvp/5kCfOy9N8AnURs.Ov/yj0c5Vnl984dSFlq2lPLWj/h9eWsm", address_line1: "100 Woods Ln", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primaryEC_fname: "Jeff", primaryEC_lname: "Williams", primaryEC_relationship: "Son", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "Q", phone: "(234) 723-4872", primaryEC_phone: "(238) 472-9384", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(922) 342-3434", primaryEC_cell: "(234) 234-2342", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "George Q Williams", confirmed: true},
  {fname: "John", lname: "Smith", email: "john@smith.com", password_digest: "$2a$10$3uKDVqhIj5Q86SObreTj3OkT/kYI4ON5vnRN7asPcy5t1OhJeljcW", address_line1: "416 St Davids Rd", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primaryEC_fname: "Jane", primaryEC_lname: "Smith", primaryEC_relationship: "Spouse", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "D", phone: "(723) 984-7329", primaryEC_phone: "(239) 847-2394", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(623) 498-1303", primaryEC_cell: "(897) 982-3723", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "John D Smith", confirmed: true},
  {fname: "Paul", lname: "Jones", email: "paul@jones.com", password_digest: "$2a$10$oz43KwRSLOy3Qq46rYEB2er2Ww8gvw1Dv5WXBaM/1NP5B37vb2FKO", address_line1: "233 Highland Ave", address_line2: "", city: "Devon", state: "PA", zip: "19333", primaryEC_fname: "Rose", primaryEC_lname: "Jones", primaryEC_relationship: "Daughter", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "F", phone: "(897) 239-8792", primaryEC_phone: "(238) 979-8237", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(234) 782-3642", primaryEC_cell: "(923) 847-2394", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Paul F Jones", confirmed: true},
  {fname: "Betty", lname: "Johnson", email: "betty@johnson.com", password_digest: "$2a$10$jRDMbC5NXFNniX740QxLJurdB.ySFLzg4KsyFYG4qtqi8WDYRt3am", address_line1: "213 Spencer Rd", address_line2: "", city: "Devon", state: "PA", zip: "19333", primaryEC_fname: "Charles", primaryEC_lname: "Johnson", primaryEC_relationship: "Son", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "P", phone: "(573) 268-2374", primaryEC_phone: "(723) 894-7239", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(623) 984-7239", primaryEC_cell: "(723) 423-9847", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Betty P Johnson", confirmed: true},
  {fname: "Rita", lname: "Baker", email: "rita@baker.com", password_digest: "$2a$10$pArQ5to/dvhqJYQJvAD8JO7lQBf/oF.k2MLxRzFbL1uo80iWYOSse", address_line1: "601 Maplewood Ave", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primaryEC_fname: "Tom", primaryEC_lname: "Baker", primaryEC_relationship: "Son", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "R", phone: "(893) 278-4982", primaryEC_phone: "(789) 237-4239", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(723) 472-3942", primaryEC_cell: "(238) 423-4792", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Rita R Baker", confirmed: true},
  {fname: "Marty", lname: "McFly", email: "marty@mcfly.com", password_digest: "$2a$10$xKSL4qpVglJVUeybuZPqiup/Qnumg.upottzu9wrZ3ZcWnca9iL7.", address_line1: "316 S Devon Ave", address_line2: "", city: "Devon", state: "PA", zip: "19087", primaryEC_fname: "Doc", primaryEC_lname: "Brown", primaryEC_relationship: "BFF", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "M", phone: "(583) 298-2309", primaryEC_phone: "(238) 420-3948", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(502) 938-4230", primaryEC_cell: "(876) 892-3748", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Marty M McFly", confirmed: true},
  {fname: "Barney", lname: "Rubble", email: "barney@rubble.com", password_digest: "$2a$10$sto7f8czQ1Nr0n9PNPayhuCE9/nscHjkIXeOICVHBpVlNMIdI2Dc2", address_line1: "407 Portland Dr", address_line2: "", city: "Broomall", state: "PA", zip: "19008", primaryEC_fname: "Betty", primaryEC_lname: "Rubble", primaryEC_relationship: "Spouse", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "B", phone: "(233) 280-9234", primaryEC_phone: "(837) 230-9482", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(789) 237-9234", primaryEC_cell: "(092) 380-9238", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Barney B Rubble", confirmed: true},
  {fname: "Marge", lname: "Simpson", email: "marge@simpson.com", password_digest: "$2a$10$3uAAKp98lko63913zrFQHeMS7YGg/v.RjowX.o97oseugxaYRbRs6", address_line1: "336 Pinecrest Rd", address_line2: "", city: "Springfield", state: "PA", zip: "19064", primaryEC_fname: "Lisa", primaryEC_lname: "Simpson", primaryEC_relationship: "daughter", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "Q", phone: "(492) 380-9238", primaryEC_phone: "(893) 472-3947", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(902) 380-9234", primaryEC_cell: "(289) 374-2398", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Marge Q Simpson", confirmed: true},
  {fname: "Hubert", lname: "Farnsworth", email: "hubert@farnsworth.com", password_digest: "$2a$10$1vWzsBneZb6iiR.g/BIYC./jG5QbRuOt3d5iyQFyxJgmbCzaaNzWq", address_line1: "532 Harrington Rd", address_line2: "", city: "Havertown", state: "PA", zip: "19083", primaryEC_fname: "Philip", primaryEC_lname: "Fry", primaryEC_relationship: "Uncle", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "J", phone: "(298) 374-3928", primaryEC_phone: "(093) 823-0948", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(239) 084-2093", primaryEC_cell: "(092) 384-0923", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Hubert J Farnsworth", confirmed: true},
  {fname: "Marie", lname: "Barone", email: "marie@barone.com", password_digest: "$2a$10$w2qw1iFpG65A1RnEiPQZCeSLGPVpxVjdGcFbIiQS3M2iXjLXmBVLu", address_line1: "118 Hillside Rd", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primaryEC_fname: "Raymond", primaryEC_lname: "Barone", primaryEC_relationship: "Son", secondaryEC_fname: "Robert", secondaryEC_lname: "Barone", secondaryEC_relationship: "Son", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "J", phone: "(749) 834-7329", primaryEC_phone: "(389) 423-9048", secondaryEC_phone: "(823) 749-8234", tertiaryEC_phone: nil, cell: "(738) 492-3749", primaryEC_cell: "(092) 384-0923", secondaryEC_cell: "(982) 390-4823", tertiaryEC_cell: nil, full_name: "Marie J Barone", confirmed: true}
])
Origin.create!([
  {member_id: 1, address_line1: "416 St Davids Rd", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primary: true, county: nil},
  {member_id: 2, address_line1: "100 Woods Ln", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primary: true, county: nil},
  {member_id: 3, address_line1: "233 Highland Ave", address_line2: "", city: "Devon", state: "PA", zip: "19333", primary: true, county: nil},
  {member_id: 4, address_line1: "213 Spencer Rd", address_line2: "", city: "Devon", state: "PA", zip: "19333", primary: true, county: nil},
  {member_id: 5, address_line1: "601 Maplewood Ave", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primary: true, county: nil},
  {member_id: 6, address_line1: "316 S Devon Ave", address_line2: "", city: "Devon", state: "PA", zip: "19087", primary: true, county: nil},
  {member_id: 8, address_line1: "407 Portland Dr", address_line2: "", city: "Broomall", state: "PA", zip: "19008", primary: true, county: nil},
  {member_id: 9, address_line1: "336 Pinecrest Rd", address_line2: "", city: "Springfield", state: "PA", zip: "19064", primary: true, county: nil},
  {member_id: 10, address_line1: "532 Harrington Rd", address_line2: "", city: "Havertown", state: "PA", zip: "19083", primary: true, county: nil},
  {member_id: 11, address_line1: "118 Hillside Rd", address_line2: "", city: "Wayne", state: "PA", zip: "19087", primary: true, county: nil}
])
