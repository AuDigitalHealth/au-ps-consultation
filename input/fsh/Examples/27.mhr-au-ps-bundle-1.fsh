Instance: mhr-au-ps-bundle-1
InstanceOf: MhrAuPsBundle
Usage: #example
Title: "MHR Generated Patient Summary - No Data Example"
Description: "An example of a MHR Generated Patient Summary Bundle resource with no data recorded in the sections."

* identifier.system = "http://mhr-operator/fhir/identifier"
* identifier.value = "84aab3e1-c04d-4785-ba9e-653e0e813a18"
* type = #document
* timestamp = "2025-06-22T17:12:58.351+10:00"

* entry[composition].fullUrl = "urn:uuid:b85141fa-3edb-42ec-b5c9-b774214ddfdc"
* entry[=].resource = b85141fa-3edb-42ec-b5c9-b774214ddfdc

* entry[patient].fullUrl = "urn:uuid:29299548-eda4-43e5-86fc-542d6179d9e3"
* entry[=].resource = 29299548-eda4-43e5-86fc-542d6179d9e3

* entry[device].fullUrl = "urn:uuid:3656fd13-0923-4076-9521-016156b0569c"
* entry[=].resource = 3656fd13-0923-4076-9521-016156b0569c

* entry[organization].fullUrl = "urn:uuid:75db2b4a-3b3a-4115-9956-a7a02eb0de31"
* entry[=].resource = 75db2b4a-3b3a-4115-9956-a7a02eb0de31


Instance: b85141fa-3edb-42ec-b5c9-b774214ddfdc
InstanceOf: MhrAuPsComposition
Usage: #inline
* status = #final
* type = $loinc#60591-5
* subject = Reference(urn:uuid:29299548-eda4-43e5-86fc-542d6179d9e3)
* date = "2025-06-22T17:12:58+10:00"
* author = Reference(urn:uuid:3656fd13-0923-4076-9521-016156b0569c)
* title = "MHR Generated Patient Summary - 22-June-2025 05:12 pm AEST"
* custodian = Reference(urn:uuid:75db2b4a-3b3a-4115-9956-a7a02eb0de31)
* section[sectionProblems].title = "Problems List"
* section[=].code = $loinc#11450-4
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No problems or conditions recorded.</div>"
* section[=].emptyReason = $list-empty-reason#unavailable
* section[=].emptyReason.text = "No information available."
* section[sectionAllergies].title = "Allergies and Intolerances"
* section[=].code = $loinc#48765-2
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No allergies or intolerances recorded.</div>"
* section[=].emptyReason = $list-empty-reason#unavailable
* section[=].emptyReason.text = "No information available."
* section[sectionMedications].title = "Medication History"
* section[=].code = $loinc#10160-0
* section[=].text.status = #generated
* section[=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No medications recorded.</div>"
* section[=].emptyReason = $list-empty-reason#unavailable
* section[=].emptyReason.text = "No information available."

Instance: 29299548-eda4-43e5-86fc-542d6179d9e3
InstanceOf: MhrAuPsPatient
Usage: #inline
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/individual-genderIdentity"
* extension[=].extension.url = "value"
* extension[=].extension.valueCodeableConcept = $sct#446141000124107 "Identifies as female gender"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/individual-pronouns"
* extension[=].extension.url = "value"
* extension[=].extension.valueCodeableConcept = $loinc#LA29519-8 "she/her/her/hers/herself"
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender"
* extension[=].extension.url = "value"
* extension[=].extension.valueCodeableConcept = $sct#248152002
* extension[=].extension.valueCodeableConcept.text = "Female"
* identifier.extension[0].url = "http://hl7.org.au/fhir/StructureDefinition/ihi-status"
* identifier.extension[=].valueCoding = $ihi-status-1#active
* identifier.extension[+].url = "http://hl7.org.au/fhir/StructureDefinition/ihi-record-status"
* identifier.extension[=].valueCoding = $ihi-record-status-1#verified "verified"
* identifier.type = $v2-0203#NI
* identifier.type.text = "IHI"
* identifier.system = "http://ns.electronichealth.net.au/id/hi/ihi/1.0"
* identifier.value = "8003608333647261"
* name.use = #usual
* name.family = "Banks"
* name.given[0] = "Mia"
* name.given[+] = "Leanne"
* telecom[0].system = #phone
* telecom[=].value = "0270102724"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "0491574632"
* telecom[=].use = #mobile
* telecom[+].system = #phone
* telecom[=].value = "0270107520"
* telecom[=].use = #home
* telecom[+].system = #email
* telecom[=].value = "mia.banks@myownpersonaldomain.com"
* telecom[+].system = #phone
* telecom[=].value = "270107520"
* telecom[=].use = #home
* gender = #female
* birthDate = "1983-08-25"
* address.line = "50 Sebastien St"
* address.city = "Minjary"
* address.state = "NSW"
* address.postalCode = "2720"
* address.country = "AU"


Instance: 3656fd13-0923-4076-9521-016156b0569c
InstanceOf: Device
Usage: #inline
* identifier.system = "http://ns.electronichealth.net.au/id/pcehr/paid/1.0"
* identifier.value = "8003640003000026"
* deviceName.name = "My Health Record"
* deviceName.type = #manufacturer-name
* owner = Reference(urn:uuid:75db2b4a-3b3a-4115-9956-a7a02eb0de31)


Instance: 75db2b4a-3b3a-4115-9956-a7a02eb0de31
InstanceOf: AUPSOrganization
Usage: #inline
* identifier.type = $v2-0203#XX
* identifier.type.text = "Australian Business Number (ABN)"
* identifier.system = "http://hl7.org.au/id/abn"
* identifier.value = "84425496912"
* name = "My Health Record system operator"
* telecom[0].system = #email
* telecom[=].value = "help@digitalhealth.gov.au"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "1300 901 001"
* telecom[=].use = #work
* address.line = "Level 25, 175 Liverpool Street"
* address.city = "Sydney"
* address.state = "NSW"
* address.postalCode = "2000"
* address.country = "Australia"
