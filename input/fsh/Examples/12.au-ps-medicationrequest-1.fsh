Instance: au-ps-medicationrequest-1
InstanceOf: AUPSMedicationRequest
Usage: #example
Title: "Medication Request Amoxicillin 250 mg oral capsule"
Description: "An example MedicationRequest for Amoxicillin 250 mg oral capsule, which is a subject of an MHR generated Patient Summary document."

* status = #active
* intent = #order
* medicationCodeableConcept = $sct#23550011000036101 "Amoxicillin 250 mg capsule"
* subject = Reference(Patine/mhr-au-ps-patient1) "Mia Leanne Banks"
* authoredOn = "2025-06-13T00:57:59.193356+10:00"
* requester.display = "Dr. John Doe"
* dosageInstruction.text = "500 mg orally every 8 hours for 7 days"