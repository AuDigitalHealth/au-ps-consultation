/*Instance: au-ps-observation-1
InstanceOf: AUPSPathologyResult
Usage: #example
Title: "Example of a Pathology Result for Appendicitis"
Description: "This example represents a pathology result for a patient with acute appendicitis, including microscopic examination findings."

* status = #final
* category[lab] = $observation-category#laboratory "Laboratory"

* code = $loinc#LP40224-5 "Microscopic observation"
* code.text = "Microscopic examination of appendix"
* subject = Reference(Patient/mhr-au-ps-patient-1) "Mia Leanne Banks"
* performer = Reference(Practitioner/au-ps-practitioner-2) "Dr. John Doe"
* effectiveDateTime = "2023-01-01T12:00:00Z"
* valueString = "Acute appendicitis with neutrophilic infiltration"*/
