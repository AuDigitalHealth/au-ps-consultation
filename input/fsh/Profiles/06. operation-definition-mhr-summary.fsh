Instance: operation-definition-mhr-summary
InstanceOf: OperationDefinition
Title: "MHR Summary"
Usage: #definition
Description: "This operation generates an **MHR Patient Summary document** from the My Health Record (MHR) system. Only HTTP POST is supported due to security and data integrity considerations. The generated summary is structured according to the Australian Patient Summary (AU PS) standards, ensuring interoperability and consistency in clinical information exchange. The generated summary is meant to server as a starting point for clinicians to author their own patient summaries to support any use case. This operation extends the [IPS Summary OperationDefinition](http://hl7.org/fhir/OperationDefinition/ips-summary) by adding Australian-specific parameters and tailoring the content to align with the requirements of the My Health Record system."

* name = "MhrSummary"
* status = #active
* kind = #operation
* code = #summary

* resource[0] = #Patient
* system = false
* type = true
* instance = false

* outputProfile[0] = "http://ns.electronichealth.net.au/fhir/mhr/au-ps/consultation/StructureDefinition/mhr-au-ps-bundle"

* parameter[0].name = #identifier
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The identifier SHALL be a valid IHI that includes both the system and value components(e.g. http://ns.electronichealth.net.au/id/hi/ihi/1.0|8003608166690003)."
* parameter[=].type = #Identifier

* parameter[+].name = #profile
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies the profile to be used for the generated summary document. Only AU PS profile is supported for now. If not provided, the default AU PS profile will be used. In the future, IPS profile may be supported as well."
* parameter[=].type = #canonical

* parameter[+].name = #section-beginDate
* parameter[=].use = #in
* parameter[=].min = 0 
* parameter[=].max = "*"
* parameter[=].documentation = "Defines the start date for retrieving information for each specified section. Multiple section-beginDate parameters can be provided to set different start dates for different sections. If not provided, the default behavior is to include all available data for the specified sections. Data is always retrieved up to the current date and time."
* parameter[=].part[0].name = #section
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].documentation = "Specifies the section for which the begin date is being defined."
* parameter[=].part[=].type = #CodeableConcept
* parameter[=].part[=].binding.strength = #required
* parameter[=].part[=].binding.valueSet = "http://ns.electronichealth.net.au/fhir/mhr/au-ps/consultation/ValueSet/summary-sections-value-set"
* parameter[=].part[+].name = #date
* parameter[=].part[=].use = #in
* parameter[=].part[=].min = 1
* parameter[=].part[=].max = "1"
* parameter[=].part[=].documentation = "Specifies the begin date for the associated section."
* parameter[=].part[=].type = #dateTime

* parameter[+].name = #exclude-section
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "Specifies sections to be excluded from the generated summary document. Only optional sections according to the AU PS specification can be excluded. This allows for customization of the summary content based on specific clinical needs or preferences."
* parameter[=].type = #CodeableConcept
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = "http://ns.electronichealth.net.au/fhir/mhr/au-ps/consultation/ValueSet/excludable-summary-sections-value-set"

* parameter[+].name = #context
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Specifies the clinical context for summary generation. This helps tailor the content and presentation of the summary to specific use cases such as emergency care, patient generated, specialist referral, or chronic disease management."
* parameter[=].type = #CodeableConcept
* parameter[=].binding.strength = #required
* parameter[=].binding.valueSet = "http://ns.electronichealth.net.au/fhir/mhr/au-ps/consultation/ValueSet/summary-context-value-set"


* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The generated MHR AU PS Document, returned as a FHIR Bundle resource. This Bundle will contain a Composition resource describing the structure of the document, along with referenced resources containing the actual clinical data. The generated Bundle conforms to [MHR AU PS](http://ns.electronichealth.net.au/fhir/mhr/au-ps/consultation/StructureDefinition/mhr-au-ps-bundle)."
* parameter[=].type = #Bundle