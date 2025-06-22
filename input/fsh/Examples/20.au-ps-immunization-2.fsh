Instance: au-ps-immunization-2
InstanceOf: AUPSImmunization
Usage: #example
Title: "Example of an Influenza Vaccine Record"
Description: "This example represents a completed immunization record for a patient who received an influenza vaccine."

* status = #completed
* vaccineCode = $air-register#GNFLU "Generic Influenza"
* patient = Reference(Patient/mhr-au-ps-patient-1)
* occurrenceDateTime = "2023-04-04T04:33:34.387982+10:00"
* primarySource = true
