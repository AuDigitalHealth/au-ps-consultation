Instance: au-ps-procedure-1
InstanceOf: AUPSProcedure
Usage: #example
Title: "Example of an Appendectomy Procedure"
Description: "This example represents a completed appendectomy procedure for a patient."

* status = #completed
* code = $sct#80146002 "Appendectomy"
* subject = Reference(Patient/mhr-au-ps-patient-1) "Mia Leanne Banks"
* performedDateTime = "2025-06-13T00:57:59.193311+10:00"
* performer.actor = Reference(Practitioner/au-ps-practitioner-2) "Dr. John Doe"