Instance: device-1
InstanceOf: Device
Usage: #example
Title: "My Health Record Device Example"
Description: "An example of a Device resource representing a My Health Record System that authors the MHR generated Patient Summary document."

* identifier.system = "http://ns.electronichealth.net.au/id/pcehr/paid/1.0"
* identifier.value = "8003640003000026"
* deviceName.name = "My Health Record"
* deviceName.type = #manufacturer-name
* owner = Reference(Organization/au-ps-organization-1)