Instance: mhr-au-ps-composition-1
InstanceOf: MhrAuPsComposition
Usage: #example
Title: "MHR Generated Patient Summary - No Data Example"
Description:
  "An example of a MHR Generated Patient Summary Composition resource with no data recorded in the sections."

* status = #final
* type = $loinc#60591-5
* subject = Reference(Patient/mhr-au-ps-patient-1)
* date = "2025-06-22T17:12:58+10:00"
* author = Reference(Device/device-1)
* title = "MHR Generated Patient Summary - 22-June-2025 05:12 pm AEST"
* custodian = Reference(Organization/au-ps-organization-1)
* section[sectionProblems].title = "Problems List"
* section[=].code = $loinc#11450-4
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No problems or conditions recorded.</div>"
* section[=].emptyReason = $list-empty-reason#unavailable
* section[=].emptyReason.text = "No information available."
* section[sectionAllergies].title = "Allergies and Intolerances"
* section[=].code = $loinc#48765-2
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No allergies or intolerances recorded.</div>"
* section[=].emptyReason = $list-empty-reason#unavailable
* section[=].emptyReason.text = "No information available."
* section[sectionMedications].title = "Medication History"
* section[=].code = $loinc#10160-0
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No medications recorded.</div>"
* section[=].emptyReason = $list-empty-reason#unavailable
* section[=].emptyReason.text = "No information available."