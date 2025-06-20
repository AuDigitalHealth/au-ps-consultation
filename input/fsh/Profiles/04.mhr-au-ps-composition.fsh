Profile: MhrAuPsComposition
Parent: AUPSComposition
Id: mhr-ps-composition
Title: "MHR AU PS Composition"
Description: "This profile constraints [AU PS Composition](https://build.fhir.org/ig/hl7au/au-fhir-ps/StructureDefinition-au-ps-composition.html) to meet the requirements of an MHR generated Patient Summary document."

* . ^short = "MHR Patient Summary composition"

* subject only Reference(MhrAuPsPatient)

* author 1..1 
* author only Reference(Device)

* custodian 1..1
* custodian only Reference(AUPSOrganization)

//* section.extension[section-note] MS
//* section.extension[section-note] ^short = "A section note to capture patient's annotations"


* section.entry.extension ^slicing.discriminator.type = #value
* section.entry.extension ^slicing.discriminator.path = "url"
* section.entry.extension ^slicing.rules = #open

* section.entry.extension contains Note named entry-note 0..1 MS
* section.entry.extension[entry-note] ^short = "An entry note to capture patient's annotations"

* section[sectionPatientStory] MS

* section[sectionPatientStory].author MS
* section[sectionPatientStory].author only Reference(MhrAuPsPatient or AUPSRelatedPerson)

* section[sectionPatientStory].entry ^slicing.discriminator.type = #profile
* section[sectionPatientStory].entry ^slicing.discriminator.path = "resolve()"
* section[sectionPatientStory].entry ^slicing.rules = #open

* section[sectionPatientStory].entry contains goal 0..* MS
* section[sectionPatientStory].entry[goal] ^short = "The patient's current goals and priorities"
* section[sectionPatientStory].entry[goal] only Reference(MhrAuPsGoal)