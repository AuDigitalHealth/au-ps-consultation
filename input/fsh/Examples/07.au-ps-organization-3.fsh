// Custodian Organization for an Event Summary Document

Instance: au-ps-organization-3
InstanceOf: AUPSOrganization
Usage: #example
Title: "Organization Health Hospital"
Description: "An example Organization that is the custodian for an Event Summary document that feeds into a generated MHR Patient Summary document."

* identifier.type = $v2-0203-au#NOI "National Organisation Identifier"
* identifier.type.text = "HPI-O"
* identifier.use = #official
* identifier.system = "http://ns.electronichealth.net.au/id/hi/hpio/1.0"
* identifier.value = "8003621566684455"
* name = "Health Hospital"
* telecom.system = #phone
* telecom.value = "+61 2 9876 5432"
* telecom.use = #work
* address.use = #work
* address.line = "456 Wellness Avenue"
* address.city = "Adelaide"
* address.state = "SA"
* address.postalCode = "5000"
* address.country = "Australia"