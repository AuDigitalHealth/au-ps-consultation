Instance: au-ps-condition-1
InstanceOf: AUPSCondition
Usage: #example
Title: "Condition, Type 2 diabetes mellitus"
Description: "An example Condition resource representing Type 2 diabetes mellitus for a patient in an MHR generated Patient Summary document."

* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = $condition-category#problem-list-item "Problem List Item"
* category.text = "Problem"
* code = $sct#44054006 "Type 2 diabetes mellitus"
* code.text = "Type 2 Diabetes"
* subject = Reference(Patient/mhr-au-ps-patient-1)
* onsetDateTime = "2018-03-15"