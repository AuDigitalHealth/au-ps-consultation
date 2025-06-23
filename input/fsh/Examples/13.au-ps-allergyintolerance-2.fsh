Instance: au-ps-allergyintolerance-2
InstanceOf: AUPSAllergyIntolerance
Usage: #example
Title: "Allergy for Eggs"
Description: "This AllergyIntolerance instance represents a confirmed allergy to eggs for a patient."

* clinicalStatus = $allergyintolerance-clinical#active
* verificationStatus = $allergyintolerance-verification#confirmed
* type = #allergy
* category = #food
* code = $sct#102263004 "Eggs (edible)"
* code.text = "Eggs"
* patient = Reference(Patient/mhr-au-ps-patient-1)
* onsetDateTime = "2015-06-01"