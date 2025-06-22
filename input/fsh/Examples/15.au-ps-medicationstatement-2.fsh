Instance: au-ps-medicationstatement-2
InstanceOf: AUPSMedicationStatement
Usage: #example
Title: "Medication Statement for Amlodipine Tablet"
Description: "An example MedicationStatement for Amlodipine 10 mg tablet, which is a subject of an MHR generated Patient Summary document."

* status = #active
* medicationCodeableConcept = $sct#23519011000036101 "Amlodipine 10 mg tablet"
* medicationCodeableConcept.text = "Amlodipine 10 mg tablet"
* subject = Reference(Patient/mhr-au-ps-patient-1)
* effectiveDateTime = "2024-12-01"