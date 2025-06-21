Instance: au-ps-condition-2
InstanceOf: AUPSCondition
Usage: #example
Title: "Condition, Hypertension"
Description: "An example Condition resource representing Hypertension for a patient in an MHR generated Patient Summary document."

* clinicalStatus = $condition-clinical#active
* verificationStatus = $condition-ver-status#confirmed
* category = $condition-category#problem-list-item "Problem List Item"
* category.text = "Problem"
* code = $sct#38341003 "Hypertension"
* code.text = "Hypertension"
* subject = Reference(Patient/mhr-au-ps-patient-1)
* onsetDateTime = "2022-09-01"