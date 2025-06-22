Instance: au-ps-organization-1
InstanceOf: AUPSOrganization
Usage: #example
Title: "Organization MHR operator"
Description: "An example Organization that operates the My Health Record system and is the custodian for the MHR generated Patient Summary document."

* identifier.type = $v2-0203#XX
* identifier.type.text = "Australian Business Number (ABN)"
* identifier.system = "http://hl7.org.au/id/abn"
* identifier.value = "84425496912"
* name = "My Health Record system operator"
* telecom[0].system = #email
* telecom[=].value = "help@digitalhealth.gov.au"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "1300 901 001"
* telecom[=].use = #work
* address.line = "Level 25, 175 Liverpool Street"
* address.city = "Sydney"
* address.state = "NSW"
* address.postalCode = "2000"
* address.country = "Australia"