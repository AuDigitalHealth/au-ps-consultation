Profile: MhrAuPsBundle
Parent: AUPSBundle
Id: mhr-au-ps-bundle
Title: "MHR AU PS Bundle"
Description: "This profile constraints [AU PS Bundle](https://build.fhir.org/ig/hl7au/au-fhir-ps/StructureDefinition-au-ps-bundle.html) to meet the requirements of an MHR generated Patient Summary document."

* . ^short = "MHR Patient Summary bundle"

* entry contains
    provenance 0..* MS and
    goal 0..* MS

* entry[provenance].resource ^short = "Provenance of information in the MHR Patient Summary document"
* entry[provenance].resource 1..1 MS
* entry[provenance].resource only MhrAuPsProvenance

* entry[goal].resource ^short = "The patient's current goals and priorities"
* entry[goal].resource 1..1 MS
* entry[goal].resource only MhrAuPsGoal
 