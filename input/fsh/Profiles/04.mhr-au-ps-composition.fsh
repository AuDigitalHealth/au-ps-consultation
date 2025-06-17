Profile: MhrPsComposition
Parent: AUPSComposition
Id: mhr-ps-composition
Title: "MHR PS Composition"
Description: "This profile constraints [AU PS Composition](https://build.fhir.org/ig/hl7au/au-fhir-ps/StructureDefinition-au-ps-composition.html) to meet the requirements of MHR Patient Summary document. It adds one additional section for Patient Story."

* . ^short = "MHR Patient Summary composition"

* subject only Reference(MhrAuPsPatient)