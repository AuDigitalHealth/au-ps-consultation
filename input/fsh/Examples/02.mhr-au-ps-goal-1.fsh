Instance: mhr-au-ps-goal-1
InstanceOf: MhrAuPsGoal
Usage: #example
Title: "Weight Loss Goal"
Description: "An example Goal for patient Mia as part of the Patient Story section of an MHR generated Patient Summary document."

* description.text = "lose 10kg"
* lifecycleStatus = #active
* subject = Reference(Patient/mhr-au-ps-patient-1)
* expressedBy = Reference(Patient/mhr-au-ps-patient-1)
* achievementStatus = $goal-achievement#in-progress "In Progress"