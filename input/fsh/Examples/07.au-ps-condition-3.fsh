Instance: au-ps-condition-3
InstanceOf: AUPSCondition
Usage: #example
Title: "Condition, Acute appendicitis"
Description: "An example Condition resource representing Acute appendicitis for a patient in an MHR generated Patient Summary document."

* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus = $condition-ver-status#confirmed "Confirmed"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* code = $sct#85189001 "Acute appendicitis"
* code.text = "Acute appendicitis"
* subject = Reference(Patient/mhr-au-ps-patient-1) "Mia Leanne Banks"
* onsetDateTime = "2011-04-10"
* note.text = "Problem/Diagnosis Comment goes here."