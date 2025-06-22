// author of an Event Summary document
Instance: au-ps-practitioner-2
InstanceOf: AUPSPractitioner
Usage: #example
Title: "Practitioner John Doe"
Description: "An example Practitioner John Doe, who is the author of an Event Summary document that feeds into the MHR generated Patient Summary document."

* identifier.use = #official
* identifier.type = $v2-0203#NPI "National provider identifier"
* identifier.type.text = "HPI-I"
* identifier.system = "http://ns.electronichealth.net.au/id/hi/hpii/1.0"
* identifier.value = "8003619900015717"
* name.use = #official
* name.prefix = "Dr"
* name.given = "John"
* name.family = "Doe"
* telecom.system = #phone
* telecom.value = "+61 2 1234 5678"
* telecom.use = #work
* address.use = #work
* address.line = "123 Health Street"
* address.city = "Adelaide"
* address.state = "SA"
* address.postalCode = "5000"
* address.country = "Australia"