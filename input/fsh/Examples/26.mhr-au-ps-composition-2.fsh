Instance: mhr-au-ps-composition-2
InstanceOf: MhrAuPsComposition
Usage: #example
Title: "MHR Generated Patient Summary - All Sparked Testing Sections"
Description:
  "An example of a MHR Generated Patient Summary Composition with Problems, Allergies, Medications, Procedures, Immunisations and Patient Story sections. These are all the sections that can be included in a MHR Generated Patient Summary Composition for the purposes of the Sparked Testing Event."

* status = #final
* type = $loinc#60591-5
* subject = Reference(Patient/mhr-au-ps-patient-1)
* date = "2025-06-22T17:58:06+10:00"
* author = Reference(Device/device-1)
* title = "MHR Generated Patient Summary - 22-June-2025 05:58 pm AEST"
* custodian = Reference(Organization/au-ps-organization-1)

* section[sectionProblems].title = "Problems List"
* section[=].code = $loinc#11450-4
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Condition</th><th>Clinical Status</th><th>Verification Status</th><th>Onset</th></tr></thead><tbody><tr><td>Type 2 Diabetes</td><td>active</td><td>confirmed</td><td>DateTimeType[2018-03-15]</td></tr><tr><td>Hypertension</td><td>active</td><td>confirmed</td><td>DateTimeType[2022-09-01]</td></tr><tr><td>Acute appendicitis</td><td>active</td><td>confirmed</td><td>DateTimeType[2011-04-10]</td></tr></tbody></table></div>"
* section[=].entry[0] = Reference(Condition/au-ps-condition-1)
* section[=].entry[+] = Reference(Condition/au-ps-condition-2)
* section[=].entry[+] = Reference(Condition/au-ps-condition-3)

* section[sectionAllergies].title = "Allergies and Intolerances"
* section[=].code = $loinc#48765-2
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Allergy</th><th>Clinical Status</th><th>Verification Status</th><th>Onset</th></tr></thead><tbody><tr><td>Penicillin</td><td>active</td><td>confirmed</td><td>DateTimeType[2010-01-01]</td></tr><tr><td>Eggs</td><td>active</td><td>confirmed</td><td>DateTimeType[2015-06-01]</td></tr></tbody></table></div>"
* section[=].entry[0] = Reference(AllergyIntolerance/au-ps-allergyintolerance-1)
* section[=].entry[+] = Reference(AllergyIntolerance/au-ps-allergyintolerance-2)

* section[sectionMedications].title = "Medication History"
* section[=].code = $loinc#10160-0
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Type</th><th>Medication</th><th>Status</th><th>Effective/Date</th><th>Dosage</th></tr></thead><tbody><tr><td>MedicationStatement</td><td>Metformin 500mg Tablet</td><td>active</td><td>DateTimeType[2021-05-01]</td><td/></tr><tr><td>MedicationStatement</td><td>Amlodipine 10 mg tablet</td><td>active</td><td>DateTimeType[2024-12-01]</td><td/></tr><tr><td>MedicationRequest</td><td/><td>active</td><td>Fri Jun 13 00:57:59 AEST 2025</td><td>500 mg orally every 8 hours for 7 days</td></tr></tbody></table></div>"
* section[=].entry[0] = Reference(MedicationStatement/au-ps-medicationstatement-1)
* section[=].entry[+] = Reference(MedicationStatement/au-ps-medicationstatement-2)
* section[=].entry[+] = Reference(MedicationRequest/au-ps-medicationrequest-1)

* section[sectionImmunizations].title = "Immunizations History"
* section[=].code = $loinc#11369-6
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Vaccine Code</th><th>Occurrence Date</th></tr></thead><tbody><tr><td>https://www.humanservices.gov.au/organisations/health-professionals/enablers/air-vaccine-code-formats|COVAST</td><td>2024-06-12</td></tr><tr><td>https://www.humanservices.gov.au/organisations/health-professionals/enablers/air-vaccine-code-formats|GNFLU</td><td>2023-04-04</td></tr></tbody></table></div>"
* section[=].entry[0] = Reference(Immunization/au-ps-immunization-1)
* section[=].entry[+] = Reference(Immunization/au-ps-immunization-2)

* section[sectionProceduresHx].title = "Procedure History"
* section[=].code = $loinc#47519-4
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Procedure Code</th><th>Performed Date</th><th>Status</th></tr></thead><tbody><tr><td>http://snomed.info/sct|80146002</td><td>2025-06-13</td><td>completed</td></tr></tbody></table></div>"
* section[=].entry = Reference(Procedure/au-ps-procedure-1)

* section[sectionPatientStory].title = "Patient Story"
* section[=].code = $loinc#81338-6
* section[=].text.status = #additional
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div>This is my story as the patient and this is how I would like to tell it.. these are my preferences and needs.. this is my culture and background</div></div>"
* section[=].entry[0] = Reference(Goal/mhr-au-ps-goal-1)