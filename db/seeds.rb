Admin.create!([
  {fname: "mdsfasdf", lname: "dsfasd", username: "sdfas", email: "mikerobinson1@gmail.com", password: "password", super_admin: true, full_name: "mdsfasdf dsfasd", active: nil}
])
Member.create!([
  {fname: "required", lname: "required", email: "required", password_digest: "required", address_line1: "required", address_line2: nil, city: "required", state: "required", zip: "required", primaryEC_fname: "required", primaryEC_lname: "required", primaryEC_relationship: "required", secondaryEC_fname: nil, secondaryEC_lname: nil, secondaryEC_relationship: nil, tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "required", phone: "required", primaryEC_phone: "required", secondaryEC_phone: nil, tertiaryEC_phone: nil, cell: nil, primaryEC_cell: nil, secondaryEC_cell: nil, tertiaryEC_cell: nil, full_name: "required required required", confirmed: true},
  {fname: "Mike", lname: "Robinson", email: "mikerobinson1@gmail.com", password_digest: "$2a$10$vC2nyIuu7ofvVQI2ys/MmeFqTR0iYjbGrCuYXGBQoiZ/TR2tv3Que", address_line1: "510 Spring Mill Ave", address_line2: "", city: "Conshohocken", state: "PA", zip: "19428", primaryEC_fname: "Mike", primaryEC_lname: "Robinson", primaryEC_relationship: "bff", secondaryEC_fname: "", secondaryEC_lname: "", secondaryEC_relationship: "", tertiaryEC_fname: nil, tertiaryEC_lname: nil, tertiaryEC_local_exchange: nil, tertiaryEC_relationship: nil, active: true, mi: "", phone: "(267) 718-7163", primaryEC_phone: "(267) 718-7163", secondaryEC_phone: "", tertiaryEC_phone: nil, cell: "(267) 718-7163", primaryEC_cell: "(267) 718-7163", secondaryEC_cell: "", tertiaryEC_cell: nil, full_name: "Mike  Robinson", confirmed: true}
])
Origin.create!([
  {member_id: 2, address_line1: "510 Spring Mill Ave", address_line2: "", city: "Conshohocken", state: "PA", zip: "19428", primary: true, county: nil}
])
