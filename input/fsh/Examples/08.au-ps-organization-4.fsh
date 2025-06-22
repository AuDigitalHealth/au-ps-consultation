// Custodian Organization for an AIR document

Instance: au-ps-organization-4
InstanceOf: AUPSOrganization
Usage: #example
Title: "Organization AIR Custodian"
Description: "An example Organization that is the custodian for an AIR document that feeds into a generated MHR Patient Summary document."

* identifier.type = $v2-0203-au#NOI "National Organisation Identifier"
* identifier.use = #official
* identifier.system = "http://ns.electronichealth.net.au/id/pcehr/paio/1.0"
* identifier.value = "8003640011000059"
* name = "Custodian"
* telecom.system = #phone
* telecom.value = "0712341234"
* telecom.use = #work
* address.use = #work
* address.line = "99 Clinician Street"
* address.city = "Healthville"
* address.state = "QLD"
* address.postalCode = "5555"
* address.country = "Australia"