Instance: mhr-au-ps-provenance-1
InstanceOf: MhrAuPsProvenance
Usage: #example
Title: "Provenance targeting a Goal"
Description: "An example Provenance that tracks a weight loss Goal as part of the Patient Story section of an MHR generated Patient Summary document."

* target = Reference(Goal/mhr-au-ps-goal-1)
* recorded = "2025-06-11T17:58:33.583+10:00"

* agent[author].who = Reference(Patient/mhr-au-ps-patient-1)

* agent[custodian].who = Reference(Organization/au-ps-organization-1)


* entity[informationSource].what.type = #Bundle
* entity[informationSource].what.display = "Patient Annotated Patient Summary document"