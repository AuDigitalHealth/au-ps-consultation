Profile: MhrAuPsProvenance
Parent: Provenance
Id: mhr-au-ps-provenance
Title: "MHR AU PS Provenance"
Description: "This profile constrains the [Goal Resource](https://hl7.org/fhir/R4/provenance.html) for the purposes of the MHR generated Patient Summary document. Provenance is a key design aspect of the MHR generated Patient Summary document. For more information, see the [Design - Provenance](design-provenance.html) page."

* . ^short = "MHR Patient Summary provenance"

* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "Slices for agents by their role in an MHR Patient Summary provenance"

* agent contains author 1..* MS
* agent[author] ^short = "A party that originates the resource"
* agent[author].type = $provenance-participant-type#author
* agent[author].who only Reference(AUPSPractitioner or AUPSPractitionerRole or MhrAuPsPatient or AUPSRelatedPerson or AUPSOrganization or Device)
* agent[author].onBehalfOf only Reference(AUPSPractitioner or AUPSPractitionerRole or MhrAuPsPatient or AUPSRelatedPerson or AUPSOrganization or Device)

* agent contains custodian 0..1 MS
* agent[custodian] ^short = "The entity that is accountable for maintaining an accurate copy of the original resource"
* agent[custodian].type = $provenance-participant-type#custodian
* agent[custodian].who only Reference(AUPSOrganization)

* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "role"
* entity ^slicing.rules = #open
* entity ^slicing.description = "Slices for entities by their role in an MHR Patient Summary provenance"

* entity contains informationSource 1..1 MS
* entity[informationSource] ^short = "The source of the information that the Provenance targets"
* entity[informationSource].role = #source