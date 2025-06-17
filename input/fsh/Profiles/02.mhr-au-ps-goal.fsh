Profile: MhrAuPsGoal
Parent: Goal
Id: mhr-au-ps-goal
Title: "MHR AU PS Goal"
Description: "This profile constrains the [Goal Resource](https://hl7.org/fhir/R4/goal.html) for the purposes of the Patient Story section within MHR generated Patient Summary document."

* . ^short = "MHR Patient Summary goal"

* subject only Reference(MhrAuPsPatient)

* expressedBy MS