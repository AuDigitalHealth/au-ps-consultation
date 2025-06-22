Instance: au-ps-medicationstatement-1
InstanceOf: AUPSMedicationStatement
Usage: #example
Title: "Medication Statement for Metformin 500mg Tablet"
Description: "An example MedicationStatement for Metformin 500mg Tablet, which is a subject of an MHR generated Patient Summary document."

* status = #active
* medicationCodeableConcept = $sct#23358011000036102 "Metformin hydrochloride 500 mg tablet"
* medicationCodeableConcept.text = "Metformin 500mg Tablet"
* subject = Reference(Patient/mhr-au-ps-patient-1)
* effectiveDateTime = "2021-05-01"