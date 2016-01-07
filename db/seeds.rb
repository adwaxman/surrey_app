# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create(fname: "required", mi: "required", lname: "required", email: "required", phone: "required",  password_digest: "required", address_line1: "required", city: "required", state: "required", zip: "required", primaryEC_fname: "required", primaryEC_lname: "required", primaryEC_phone: "required", primaryEC_relationship: "required",  confirmed: true, active: true)
