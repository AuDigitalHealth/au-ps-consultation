Instance: au-ps-allergyintolerance-1
InstanceOf: AUPSAllergyIntolerance
Usage: #example
Title: "AllergyIntolerance Example for Penicillin"
Description: "An example of an AllergyIntolerance resource for a patient with a penicillin allergy."

* clinicalStatus = $allergyintolerance-clinical#active
* verificationStatus = $allergyintolerance-verification#confirmed
* type = #allergy
* category = #medication
* code = $sct#764146007 "Penicillin"
* code.text = "Penicillin"
* patient = Reference(Patient/mhr-au-ps-patient-1)
* onsetDateTime = "2010-01-01"