Instance: find-content-by-patient
InstanceOf: OperationDefinition
Title: "Find Content By Patient"
Usage: #definition
Description: "This an example of a [FHIR Named Query](https://hl7.org/fhir/R4/search.html#query) designed to support a broad range of discovery capabilities within the My Health Record (MHR) system. More specialised queries may be introduced as needed. For further context on the rationale and design of Named Queries, please refer to the [Design - Generation](design-generation.html) page of this Implementation Guide. 

This page outlines a potential approach how this Named Query can be leveraged to generate a Patient Summary document from content uploaded to MHR by various organisations. It also outlines how the same Named Query can be expanded to support discovery of other content types just by changing its parameters. 

The current design of the Named Query requires four points of identification for the patient, along with a parameter specifying the type of content to be discovered, i.e. the LOINC code for a Patient Summary Document. Additionally, there is an optional parameter to allow the inclusion of the non-mandatory sections in the generated Patient Summary document."

* version = "0.1.0"
* name = "findContentByPatient"
* status = #active
* kind = #query
* code = #find-content-by-patient
* resource = #Bundle
* system = false
* type = true
* instance = false


* parameter[0].name = #patient.identifier
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The IHI identifier of the subject of the content being discovered."
* parameter[=].type = #string
* parameter[=].searchType = #token

* parameter[+].name = #patient.birthDate
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The date of birth of the patient."
* parameter[=].type = #string
* parameter[=].searchType = #date

* parameter[+].name = #patient.family
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The family name of the patient."
* parameter[=].type = #string
* parameter[=].searchType = #string

* parameter[+].name = #patient.gender
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The gender of the patient."
* parameter[=].type = #string
* parameter[=].searchType = #token

* parameter[+].name = #content-code
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The type of content being discovered. Ideally, this parameter would have a required binding to a ValueSet representing supported content types by the system offering the Named Query. Client systems can dynamically $expand this ValueSet to find the content types supported for discovery. If the content is then represented as documents that are rendered in a consistent manner, client systems wouldn't need to change to discover and render new content types, as long as they are included in this ValueSet. Combining this with a well-though hierarchical structure of the CodeSystem(s) has tht potential to be a powerful discovery mechanism."
* parameter[=].type = #string
* parameter[=].searchType = #token
* parameter[=].binding.strength = #example
* parameter[=].binding.valueSet = "http://ns.electronichealth.net.au/fhir/mhr/ps/sparked-testing/ValueSet/content-type-example-vs"

* parameter[+].name = #section-lookback
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Optional parameter to include additional sections (e.g., Immunisations, Procedures, Patient Story) in the generated Patient Summary document suing their LOINC codes. It allows specifying a look-back date for each section. If no look back date is specified, a system default of 2 years of Immunisations and 5 years of Procedures is applied. If the parameter is completely omitted, only mandatory sections (Problems, Allergies, Medications) are generated. This parameter is only applicable only to generated documents, not uploaded ones."
* parameter[=].type = #string
* parameter[=].searchType = #composite


* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The result is a searchset Bundle containing instances of content, on-demand or uploaded, matching the criteria of the Named Query. For the purposes of this Implementation Guide, the entries in the Bundle will be instances of [MHR AU PS Bundle](StructureDefinition-mhr-au-ps-bundle.html). The instances can be on-demand generated Patient Summary documents, or uploaded documents in the MHR. Additional parameters can be added to control that behaviour."
* parameter[=].type = #Bundle