Instance: au-ps-immunization-1
InstanceOf: AUPSImmunization
Usage: #example
Title: "Example of a COVID-19 Vaccine Record"
Description: "This example represents a completed immunization record for a patient who received a COVID-19 vaccine."

* status = #completed
* vaccineCode = $air-register#COVAST "COVID-19 Vaccine AstraZeneca"
* patient = Reference(Patient/mhr-au-ps-patient-1)
* occurrenceDateTime = "2024-06-12T04:33:34.387886+10:00"
* primarySource = true