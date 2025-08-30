The Agency continually seeks opportunities to support patients in taking a more active role in their health and ensuring their voices are genuinely heard in the care they receive. Enabling individuals to share their stories, cultural backgrounds, and lived experiences is a key part of delivering high-quality, person-centred care.

When healthcare professionals have access to patient-expressed insights—whether spoken, written, or otherwise conveyed—it can enrich clinical decision-making, foster empathy, and contribute to better health outcomes. The Agency is actively exploring practical ways to bring this vision to life.

### Technical Exploration
To support this vision, the Agency is investigating several technical options for capturing and integrating "Patient Story" content into MHR. One promising approach—relevant to this Implementation Guide—involves enabling patients to annotate the Patient Summary document generated via a FHIR Named Query.

### Workflow Overview
- **Generation**: An MHR conformant system invokes the [findContentByPatient Named Query](OperationDefinition-find-content-by-patient.html) to generate a Patient Summary document from content stored in MHR. Please, refer to the [Patient Summary generation design page](design-generation.html) for more details.
- **Contribution**: The patient is given the opportunity to:
  - Add annotations at the section or entry level of the generated document
  - Tell their personal goals and narrative as part of a dedicated Patient Story section.
- **Submission**: The annotated Patient Summary, including the Patient Story, is submitted back to MHR.
- **Access**: When a healthcare provider next generates the Patient Summary document, the patient-authored content is included, giving clinicians access to the patient’s voice and perspective.

### Example for Demo Purposes

1. The patient logins to an MHR conformant portal and chooses to tell their story. What sits behind the "My Story" button is a call to the the [Find Content By Patient Named Query](OperationDefinition-find-content-by-patient.html) that triggers MHR system to generate a Patient Summary document.

<figure style="text-align: center;">
  <img style="padding-top:0;padding-bottom:10px;display: block; margin: 0 auto;width: 75%;height: auto;" src="ps-generation.png" alt="Generate a patient summary"/>
</figure>

2. Patient can add annotations on a composition.section or composition.section.entry level

<figure style="text-align: center;">
  <img style="padding-top:0;padding-bottom:10px;display: block; margin: 0 auto;width: 75%;height: auto;" src="ps-annotation.png" alt="Annotate a patient summary"/>
</figure>

3. The patient can also update their story and add Goals

<figure style="text-align: center;">
  <img style="padding-top:0;padding-bottom:10px;display: block; margin: 0 auto;width: 75%;height: auto;" src="ps-story.png" alt="Author a patient story"/>
</figure>

4. The below Patient Summary document can then be sent to the MHR system and contribute to following request to generate a Patient Summary.

```json
{
  "resourceType": "Bundle",
  "meta": {
    "profile": [
      "http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips",
      "http://hl7.org.au/fhir/ps/StructureDefinition/au-ps-bundle"
    ]
  },
  "identifier": {
    "system": "http://myportal.org",
    "value": "23308286-8074-43e1-b58a-8956ad706305"
  },
  "type": "document",
  "timestamp": "2025-06-11T17:58:33.583+10:00",
  "entry": [
    {
      "fullUrl": "urn:uuid:add0d9a5-43d1-41cb-bdaa-cf7417c18f21",
      "resource": {
        "resourceType": "Composition",
        "extension": [
          {
            "extension": [
              {
                "url": "party",
                "valueReference": {
                  "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
                }
              }
            ],
            "url": "http://hl7.org/fhir/uv/fhir-clinical-document/StructureDefinition/ParticipantExtension"
          }
        ],
        "status": "final",
        "type": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "60591-5"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "date": "2025-06-11T17:57:18+10:00",
        "author": [
          {
            "reference": "urn:uuid:cdcdf6f9-fff3-40ba-9dfc-daa36f86b856"
          }
        ],
		    "custodian" : {
		      "reference" : "urn:uuid:3573f7f7-b8a1-4e37-ad32-168291dfe1b0"
		    },
        "title": "Annotated Patient Summary on 11 June 2025 at 05:58 pm AEST",
        "section": [
          {
            "title": "Problems List",
            "code": {
              "coding": [
                {
                  "system": "http://loinc.org",
                  "code": "11450-4"
                }
              ]
            },
            "text": {
              "status": "generated",
              "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Condition</th><th>Clinical Status</th><th>Verification Status</th><th>Onset</th></tr></thead><tbody><tr><td>Type 2 Diabetes</td><td>active</td><td>confirmed</td><td>DateTimeType[2018-03-15]</td></tr><tr><td>Hypertension</td><td>active</td><td>confirmed</td><td>DateTimeType[2022-09-01]</td></tr></tbody></table></div>"
            },
            "entry": [
              {
                "reference": "urn:uuid:8c092520-9b06-49a2-996c-e5ef9a46c6d3"
              },
              {
                "reference": "urn:uuid:59fd7206-f911-42e4-8725-6b03fea77cef"
              }
            ],
            "extension": [
              {
                "url": "http://hl7.org/fhir/StructureDefinition/note",
                "valueAnnotation": {
                  "authorReference": {
                    "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
                  },
                  "time": "2025-06-11T17:58:33.583+10:00",
                  "text": "example section level annotation by the patient"
                }
              }
            ]
          },
          {
            "title": "Allergies and Intolerances",
            "code": {
              "coding": [
                {
                  "system": "http://loinc.org",
                  "code": "48765-2"
                }
              ]
            },
            "text": {
              "status": "generated",
              "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Allergy</th><th>Clinical Status</th><th>Verification Status</th><th>Onset</th></tr></thead><tbody><tr><td>Penicillin</td><td>active</td><td>confirmed</td><td>DateTimeType[2010-01-01]</td></tr><tr><td>Eggs</td><td>active</td><td>confirmed</td><td>DateTimeType[2015-06-01]</td></tr></tbody></table></div>"
            },
            "entry": [
              {
                "reference": "urn:uuid:437f93a1-6a94-4e3f-9fd2-9d8073dbb567"
              },
              {
                "reference": "urn:uuid:6bead3a2-1501-489f-8b95-f9f4b3c65eae",
                "extension": [
                  {
                    "url": "http://adha.gov.au/fhir/StructureDefinition/entry-annotation",
                    "valueAnnotation": {
                      "authorReference": {
                        "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
                      },
                      "time": "2025-06-11T17:58:33.583+10:00",
                      "text": "example entry level annotation by the patient"
                    }
                  }
                ]
              }
            ]
          },
          {
            "title": "Medication History",
            "code": {
              "coding": [
                {
                  "system": "http://loinc.org",
                  "code": "10160-0"
                }
              ]
            },
            "text": {
              "status": "generated",
              "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table border=\"1\"><thead><tr><th>Type</th><th>Medication</th><th>Status</th><th>Effective/Date</th><th>Dosage</th></tr></thead><tbody><tr><td>MedicationStatement</td><td>Metformin 500mg Tablet</td><td>active</td><td>DateTimeType[2021-05-01]</td><td/></tr><tr><td>MedicationStatement</td><td>Amlodipine 5 mg and lisinopril 20 mg tablet</td><td>active</td><td>DateTimeType[2024-12-01]</td><td/></tr></tbody></table></div>"
            },
            "entry": [
              {
                "reference": "urn:uuid:94a43dc5-4d1b-48b5-b9fc-873b3548c775"
              },
              {
                "reference": "urn:uuid:629afd3e-1bbe-4cb4-bb28-78268ff646fb"
              }
            ]
          },
          {
            "title": "Patient Story",
            "code": {
              "coding": [
                {
                  "system": "http://loinc.org",
                  "code": "81338-6",
                  "display": "Patient Goals, preferences, and priorities for care experience"
                }
              ]
            },
			"author": [
              {
                "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
              }
            ],
            "text": {
              "status": "generated",
              "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">This is my story as the patient and this is how I would like to tell it.. these are my preferences and needs.. this is my culture and background</div>"
            },
            "entry": [
              {
                "reference": "urn:uuid:1ad48719-7a65-4c0a-9f8e-f8083fdaf680"
              },
              {
                "reference": "urn:uuid:1d00b2c8-f551-415b-a2a1-104e4b5609c2"
              }
            ]
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452",
      "resource": {
        "resourceType": "Patient",
        "id": "bd651969-5c97-4626-900a-0d9e12a78452",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2025-06-11T17:40:46.768+10:00",
          "source": "#S6e6jcC0rqJz6Svk"
        },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><b>Name:</b> Mia Leanne Banks<br/><b>Date of Birth:</b> 1983-08-25<br/><b>Gender:</b> female</div>"
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/individual-genderIdentity",
            "extension": [
              {
                "url": "value",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://snomed.info/sct",
                      "code": "446141000124107",
                      "display": "Identifies as female gender (finding)"
                    }
                  ]
                }
              }
            ]
          },
          {
            "url": "http://hl7.org/fhir/StructureDefinition/individual-pronouns",
            "extension": [
              {
                "url": "value",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://loinc.org",
                      "code": "LA29519-8",
                      "display": "she/her/her/hers/herself"
                    }
                  ]
                }
              }
            ]
          },
          {
            "url": "http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender",
            "extension": [
              {
                "url": "value",
                "valueCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://snomed.info/sct",
                      "code": "248152002"
                    }
                  ],
                  "text": "Female"
                }
              }
            ]
          }
        ],
        "identifier": [
          {
            "extension": [
              {
                "url": "http://hl7.org.au/fhir/StructureDefinition/ihi-status",
                "valueCoding": {
                  "system": "https://healthterminologies.gov.au/fhir/CodeSystem/ihi-status-1",
                  "code": "active"
                }
              },
              {
                "url": "http://hl7.org.au/fhir/StructureDefinition/ihi-record-status",
                "valueCoding": {
                  "system": "https://healthterminologies.gov.au/fhir/CodeSystem/ihi-record-status-1",
                  "code": "verified",
                  "display": "verified"
                }
              }
            ],
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "NI"
                }
              ],
              "text": "IHI"
            },
            "system": "http://ns.electronichealth.net.au/id/hi/ihi/1.0",
            "value": "8003608333647261"
          }
        ],
        "name": [
          {
            "use": "usual",
            "family": "Banks",
            "given": [
              "Mia",
              "Leanne"
            ]
          }
        ],
        "telecom": [
          {
            "system": "phone",
            "value": "0270102724",
            "use": "work"
          },
          {
            "system": "phone",
            "value": "0491574632",
            "use": "mobile"
          },
          {
            "system": "phone",
            "value": "0270107520",
            "use": "home"
          },
          {
            "system": "email",
            "value": "mia.banks@myownpersonaldomain.com"
          },
          {
            "system": "phone",
            "value": "270107520",
            "use": "home"
          }
        ],
        "gender": "female",
        "birthDate": "1983-08-25",
        "address": [
          {
            "line": [
              "50 Sebastien St"
            ],
            "city": "Minjary",
            "state": "NSW",
            "postalCode": "2720",
            "country": "AU"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:cdcdf6f9-fff3-40ba-9dfc-daa36f86b856",
      "resource": {
        "resourceType": "Device",
        "id": "cdcdf6f9-fff3-40ba-9dfc-daa36f86b856",
        "identifier": [
          {
            "system": "http://ns.electronichealth.net.au/id/pcehr/paid/1.0",
            "value": "8003640003000026"
          }
        ],
        "deviceName": [
          {
            "name": "My Health Record",
            "type": "manufacturer-name"
          }
        ],
        "owner": {
          "reference": "urn:uuid:3573f7f7-b8a1-4e37-ad32-168291dfe1b0"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:3573f7f7-b8a1-4e37-ad32-168291dfe1b0",
      "resource": {
        "resourceType": "Organization",
        "id": "3573f7f7-b8a1-4e37-ad32-168291dfe1b0",
        "identifier": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "XX"
                }
              ],
              "text": "Australian Business Number (ABN)"
            },
            "system": "http://hl7.org.au/id/abn",
            "value": "84425496912"
          }
        ],
        "name": "My Health Record system operator",
        "telecom": [
          {
            "system": "email",
            "value": "help@digitalhealth.gov.au",
            "use": "work"
          },
          {
            "system": "phone",
            "value": "1300 901 001",
            "use": "work"
          }
        ],
        "address": [
          {
            "line": [
              "Level 25, 175 Liverpool Street"
            ],
            "city": "Sydney",
            "state": "NSW",
            "postalCode": "2000",
            "country": "AU"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:8c092520-9b06-49a2-996c-e5ef9a46c6d3",
      "resource": {
        "resourceType": "Condition",
        "id": "8c092520-9b06-49a2-996c-e5ef9a46c6d3",
        "clinicalStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
              "code": "active"
            }
          ]
        },
        "verificationStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
              "code": "confirmed"
            }
          ]
        },
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "44054006",
              "display": "Type 2 diabetes mellitus"
            }
          ],
          "text": "Type 2 Diabetes"
        },
        "subject": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "onsetDateTime": "2018-03-15"
      }
    },
    {
      "fullUrl": "urn:uuid:908ca999-2043-4170-8a01-8fc5058dba2a",
      "resource": {
        "resourceType": "Practitioner",
        "identifier": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                  "code": "NPI",
                  "display": "National provider identifier"
                }
              ],
              "text": "HPI-I"
            },
            "system": "http://ns.electronichealth.net.au/id/hi/hpii/1.0",
            "value": "8003616566719020"
          }
        ],
        "name": [
          {
            "use": "official",
            "family": "Fryer",
            "given": [
              "Chau"
            ],
            "prefix": [
              "Dr."
            ]
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:37d77522-89d4-4f47-95a9-6081a21fa48a",
      "resource": {
        "resourceType": "Organization",
        "identifier": [
          {
            "system": "http://ns.electronichealth.net.au/id/hi/hpio/1.0",
            "value": "8003620000030333"
          }
        ],
        "name": "Murrabit Medical Centre",
        "address": [
          {
            "line": [
              "123 Murray St"
            ],
            "city": "Murrabit",
            "state": "VIC",
            "postalCode": "3579",
            "country": "AU"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:bc084be5-66c5-4f62-b891-7aa1ee995aea",
      "resource": {
        "resourceType": "Provenance",
        "id": "bc084be5-66c5-4f62-b891-7aa1ee995aea",
        "target": [
          {
            "reference": "urn:uuid:8c092520-9b06-49a2-996c-e5ef9a46c6d3"
          }
        ],
        "recorded": "2025-06-11T10:00:00.000+10:00",
        "agent": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "author",
                  "display": "Author"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:908ca999-2043-4170-8a01-8fc5058dba2a"
            }
          },
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "custodian",
                  "display": "Custodian"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:37d77522-89d4-4f47-95a9-6081a21fa48a"
            }
          }
        ],
        "entity": [
          {
            "role": "source",
            "what": {
              "reference": "Bundle/3"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:59fd7206-f911-42e4-8725-6b03fea77cef",
      "resource": {
        "resourceType": "Condition",
        "id": "59fd7206-f911-42e4-8725-6b03fea77cef",
        "clinicalStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
              "code": "active"
            }
          ]
        },
        "verificationStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
              "code": "confirmed"
            }
          ]
        },
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "38341003",
              "display": "Hypertension"
            }
          ],
          "text": "Hypertension"
        },
        "subject": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "onsetDateTime": "2022-09-01"
      }
    },
    {
      "fullUrl": "urn:uuid:51e1de3d-0f8c-407c-aee0-ff1481a42e9e",
      "resource": {
        "resourceType": "Provenance",
        "id": "51e1de3d-0f8c-407c-aee0-ff1481a42e9e",
        "target": [
          {
            "reference": "urn:uuid:59fd7206-f911-42e4-8725-6b03fea77cef"
          }
        ],
        "recorded": "2025-06-11T10:00:00.000+10:00",
        "agent": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "author",
                  "display": "Author"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:908ca999-2043-4170-8a01-8fc5058dba2a"
            }
          },
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "custodian",
                  "display": "Custodian"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:37d77522-89d4-4f47-95a9-6081a21fa48a"
            }
          }
        ],
        "entity": [
          {
            "role": "source",
            "what": {
              "reference": "Bundle/3"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:437f93a1-6a94-4e3f-9fd2-9d8073dbb567",
      "resource": {
        "resourceType": "AllergyIntolerance",
        "id": "437f93a1-6a94-4e3f-9fd2-9d8073dbb567",
        "clinicalStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical",
              "code": "active"
            }
          ]
        },
        "verificationStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification",
              "code": "confirmed"
            }
          ]
        },
        "type": "allergy",
        "category": [
          "medication"
        ],
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "764146007",
              "display": "Penicillin"
            }
          ],
          "text": "Penicillin"
        },
        "patient": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "onsetDateTime": "2010-01-01"
      }
    },
    {
      "fullUrl": "urn:uuid:a2e7cbf3-0d8d-4943-80d4-40547fe384b8",
      "resource": {
        "resourceType": "Provenance",
        "id": "a2e7cbf3-0d8d-4943-80d4-40547fe384b8",
        "target": [
          {
            "reference": "urn:uuid:437f93a1-6a94-4e3f-9fd2-9d8073dbb567"
          }
        ],
        "recorded": "2025-06-11T10:00:00.000+10:00",
        "agent": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "author",
                  "display": "Author"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:908ca999-2043-4170-8a01-8fc5058dba2a"
            }
          },
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "custodian",
                  "display": "Custodian"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:37d77522-89d4-4f47-95a9-6081a21fa48a"
            }
          }
        ],
        "entity": [
          {
            "role": "source",
            "what": {
              "reference": "Bundle/3"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:6bead3a2-1501-489f-8b95-f9f4b3c65eae",
      "resource": {
        "resourceType": "AllergyIntolerance",
        "id": "6bead3a2-1501-489f-8b95-f9f4b3c65eae",
        "clinicalStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical",
              "code": "active"
            }
          ]
        },
        "verificationStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification",
              "code": "confirmed"
            }
          ]
        },
        "type": "allergy",
        "category": [
          "food"
        ],
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "102263004",
              "display": "Eggs (edible)"
            }
          ],
          "text": "Eggs"
        },
        "patient": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "onsetDateTime": "2015-06-01"
      }
    },
    {
      "fullUrl": "urn:uuid:8938da03-54e3-49f5-b075-681e2ffc58f8",
      "resource": {
        "resourceType": "Provenance",
        "id": "8938da03-54e3-49f5-b075-681e2ffc58f8",
        "target": [
          {
            "reference": "urn:uuid:6bead3a2-1501-489f-8b95-f9f4b3c65eae"
          }
        ],
        "recorded": "2025-06-11T10:00:00.000+10:00",
        "agent": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "author",
                  "display": "Author"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:908ca999-2043-4170-8a01-8fc5058dba2a"
            }
          },
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "custodian",
                  "display": "Custodian"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:37d77522-89d4-4f47-95a9-6081a21fa48a"
            }
          }
        ],
        "entity": [
          {
            "role": "source",
            "what": {
              "reference": "Bundle/3"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:94a43dc5-4d1b-48b5-b9fc-873b3548c775",
      "resource": {
        "resourceType": "MedicationStatement",
        "id": "94a43dc5-4d1b-48b5-b9fc-873b3548c775",
        "status": "active",
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "325278007",
              "display": "Metformin hydrochloride 500 mg oral tablet"
            }
          ],
          "text": "Metformin 500mg Tablet"
        },
        "subject": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "effectiveDateTime": "2021-05-01"
      }
    },
    {
      "fullUrl": "urn:uuid:20e9e91e-20d9-426c-a7e3-99c89212f14a",
      "resource": {
        "resourceType": "Provenance",
        "id": "20e9e91e-20d9-426c-a7e3-99c89212f14a",
        "target": [
          {
            "reference": "urn:uuid:94a43dc5-4d1b-48b5-b9fc-873b3548c775"
          }
        ],
        "recorded": "2025-06-11T10:00:00.000+10:00",
        "agent": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "author",
                  "display": "Author"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:908ca999-2043-4170-8a01-8fc5058dba2a"
            }
          },
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "custodian",
                  "display": "Custodian"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:37d77522-89d4-4f47-95a9-6081a21fa48a"
            }
          }
        ],
        "entity": [
          {
            "role": "source",
            "what": {
              "reference": "Bundle/3"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:629afd3e-1bbe-4cb4-bb28-78268ff646fb",
      "resource": {
        "resourceType": "MedicationStatement",
        "id": "629afd3e-1bbe-4cb4-bb28-78268ff646fb",
        "status": "active",
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "1193824004",
              "display": "Amlodipine (as amlodipine besylate) 5 mg and lisinopril 20 mg oral tablet"
            }
          ],
          "text": "Amlodipine 5 mg and lisinopril 20 mg tablet"
        },
        "subject": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "effectiveDateTime": "2024-12-01"
      }
    },
    {
      "fullUrl": "urn:uuid:e7b10cae-771d-4e6b-b1fd-ef0725c46522",
      "resource": {
        "resourceType": "Provenance",
        "id": "e7b10cae-771d-4e6b-b1fd-ef0725c46522",
        "target": [
          {
            "reference": "urn:uuid:629afd3e-1bbe-4cb4-bb28-78268ff646fb"
          }
        ],
        "recorded": "2025-06-11T10:00:00.000+10:00",
        "agent": [
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "author",
                  "display": "Author"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:908ca999-2043-4170-8a01-8fc5058dba2a"
            }
          },
          {
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                  "code": "custodian",
                  "display": "Custodian"
                }
              ]
            },
            "who": {
              "reference": "urn:uuid:37d77522-89d4-4f47-95a9-6081a21fa48a"
            }
          }
        ],
        "entity": [
          {
            "role": "source",
            "what": {
              "reference": "Bundle/3"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:1ad48719-7a65-4c0a-9f8e-f8083fdaf680",
      "resource": {
        "resourceType": "Goal",
        "description": {
          "text": "lose 10kg"
        },
        "lifecycleStatus": "active",
        "subject": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "expressedBy": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "achievementStatus": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/goal-achievement",
              "code": "in-progress",
              "display": "In Progress"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:1d00b2c8-f551-415b-a2a1-104e4b5609c2",
      "resource": {
        "resourceType": "Goal",
        "description": {
          "text": "walk 5km without stopping"
        },
        "lifecycleStatus": "active",
        "subject": {
          "reference": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        },
        "source": {
          "expressedBy": "urn:uuid:bd651969-5c97-4626-900a-0d9e12a78452"
        }
      }
    }
  ]
}
```

### Technical Considerations

There are a few points worth consideration in this model

1. The composition.author and composition.custodian in the annotated Patient Summary document continue to reference My Health Record and My Health Record Operator.
   
2. Patient annotations are tracked at the section level via `Composition.section.extension:section-note`, and on at the entry level via `Composition.section.entry.extension:entry-note`. While the [Extension: Note](https://hl7.org/fhir/extensions/5.2.0/StructureDefinition-note.html) is already defined, it has not been adopted by the IPS or AU PS at the section.entry level. Additionally, systems are expected to render these annotations, although there are currently no defined "Must Support" flags or formal obligations associated with them.

3. The Patient Story section includes an author field (section.author) that references the patient.

4. Provenance is used to track the context of the information. This is discussed in more detail on the [Design - Provenance page](design-provenance.html)