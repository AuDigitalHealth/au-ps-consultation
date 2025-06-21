Instance: au-ps-allergyintolerance-2
InstanceOf: AUPSAllergyIntolerance
Usage: #example
* clinicalStatus = $allergyintolerance-clinical#active
* verificationStatus = $allergyintolerance-verification#confirmed
* type = #allergy
* category = #food
* code = $sct#102263004 "Eggs (edible)"
* code.text = "Eggs"
* patient = Reference(Patient/au-ps-patient1)
* onsetDateTime = "2015-06-01"