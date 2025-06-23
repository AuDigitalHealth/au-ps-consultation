Below are some key scenarios demonstrating how to invoke the Named Query and the expected behavior in each case.

#### How to Invoke the Named Query - Mandatory Sections Only

As per the [FHIR Specification](https://hl7.org/fhir/R4/search.html#query), a Named Query is an advanced search operation specified using the `_query` parameter. Here's an example using curl:

```bash
curl -X GET [base]/Bundle?_query=findContentByPatient \
  &patient.identifier=http%3A%2F%2Fns.electronichealth.net.au%2Fid%2Fhi%2Fihi%2F1.0%7C8003608333647261 \
  &patient.family=Banks \
  &patient.birthdate=1983-08-25 \
  &patient.gender=female \
  &content-code=http://loinc.org%7C60591-5
```

Invoking the Named Query as shown above will generate a Patient Summary document containing only the mandatory sections, assuming there is matching patient on the server:
- Problems List
- Allergies
- Medications

If no content is found for one or more of these sections, they will still be included in the document with an empty reason, in accordance with the [FHIR International Patient Summary (IPS) guidance on empty sections](https://build.fhir.org/ig/HL7/fhir-ips/Empty-Sections-and-Missing-Data.html).

> Note: The Named Query above will generate a Patient Summary document on-demand and also discover any uploaded Patient Summary documents associated with the patient. Uploaded documents will be retrieved in their original format—not limited to just the mandatory sections of a Patient Summary document. Additional parameters can be introduced to the Named Query to control that behaviour. As discussed in the Home Page of the Implementation Guide, the focus of this testing event is the generation process of a Patient Summary document from MHR.

> Note: Ensure that all required parameters are URL-encoded and that the base URL ([base]) is replaced with the actual FHIR server endpoint.

#### How to Invoke the Named Query - Include Non-Mandatory Sections

To include non-mandatory sections in the generated Patient Summary document, use the section-lookback parameter. This is a composite search parameter that allows specifying which additional sections to include and optionally defining a look-back period for each.

For this testing event, the following non-mandatory sections are in available for inclusion through their LOINC codes:
- Procedures
- Immunisations
- Patient Story

If no look-back period is explicitly defined:
- Procedures will default to a 5-year look-back.
- Immunisations will default to a 2-year look-back.
- Patient Story does not use a look-back period and will include all relevant Goals.

Example invocation:

```curl
curl -X GET [base]/Bundle?_query=findContentByPatient \
  &patient.identifier=http%3A%2F%2Fns.electronichealth.net.au%2Fid%2Fhi%2Fihi%2F1.0%7C8003608333647261 \
  &patient.family=Banks \
  &patient.birthdate=1983-08-25 \
  &patient.gender=female \
  &content-code=http://loinc.org%7C60591-5 \
  &section-lookback=http://loinc.org%7C11369-6$2023-01-01,http://loinc.org%7C47519-4$2020-01-01,http://loinc.org%7C81338-6
```

#### Scenario: Patient Not Found

If the patient is unknown to the FHIR server—meaning no patient matches the four points of identification provided in the Named Query—the server will respond with an empty `searchset` Bundle. Here's an example:

```json
{
    "resourceType": "Bundle",
    "id": "746dcad4-ea4d-427b-b3d8-d8dfc86cc5df",
    "meta": {
        "lastUpdated": "2025-06-19T11:51:52.072+10:00"
    },
    "type": "searchset",
    "total": 0,
    "link": [
        {
            "relation": "self",
            "url": "[base]/Bundle?_query=findContentByPatient&content-code=http%3A%2F%2Floinc.org%7C60591-5&patient.birthdate=1983-08-25&patient.family=Banks&patient.gender=female&patient.identifier=http%3A%2F%2Fns.electronichealth.net.au%2Fid%2Fhi%2Fihi%2F1.0%7C8003608333647261"
        }
    ]
}
```

> Note: If multiple patients are found (which should not occur under normal circumstances), the server will return an OperationOutcome resource indicating an error.

#### Scenario: Patient Summary Content Unavailable for All or Some Sections

In this scenario, the patient is successfully identified using the four required parameters. However, there is no relevant content in the uploaded documents to populate some or all of the Patient Summary sections.

For this implementation, the Patient Summary document is expected to include the following sections:
- Problems List
- Allergies
- Medications
- Immunisations
- Procedures
- Patient History

If the uploaded content cannot populate one or more of these sections, a Patient Summary document will still be generated. In accordance with the [FHIR International Patient Summary (IPS) guidance on empty sections](https://build.fhir.org/ig/HL7/fhir-ips/Empty-Sections-and-Missing-Data.html), the requested sections—at a minimum, the mandatory ones if no optional sections are specified—will be included with an empty reason, indicating that no data was available.

For a document to be found and its data to contribute to the generated MHR Patient Summary document, the IHI (Individual Healthcare Identifier) in the Patient resource of that document must match the IHI provided in the Named Query invocation. This matching logic is configurable and can be adapted to suit specific implementation needs.

> Note: The example below does not include optional sections (e.g., Immunisations, Procedures, Patient Story) because they were not requested in the invocation of the Named Query. However, the same logic applies—if these sections are requested but no relevant content is found, they will be included with an empty reason.

```json
{
    "resourceType": "Bundle",
    "id": "25e3b68a-7b11-42fe-9628-2101d3349711",
    "meta": {
        "lastUpdated": "2025-06-19T12:04:05.203+10:00"
    },
    "type": "searchset",
    "total": 1,
    "link": [
        {
            "relation": "self",
            "url": "[base]Bundle?_query=findContentByPatient&content-code=http%3A%2F%2Floinc.org%7C60591-5&patient.birthdate=1983-08-25&patient.family=Banks&patient.gender=female&patient.identifier=http%3A%2F%2Fns.electronichealth.net.au%2Fid%2Fhi%2Fihi%2F1.0%7C8003608333647261"
        }
    ],
    "entry": [
        {
            "fullUrl": "http://localhost:443/fhir/Bundle/23409ef4-9761-4991-b331-43afa57cff5a",
            "resource": {
                "resourceType": "Bundle",
                "id": "23409ef4-9761-4991-b331-43afa57cff5a",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/uv/ips/StructureDefinition/Bundle-uv-ips",
                        "http://hl7.org.au/fhir/ps/StructureDefinition/au-ps-bundle"
                    ]
                },
                "identifier": {
                    "system": "http://mhr-operator/fhir/identifier",
                    "value": "4bdeae67-6f12-484f-b314-5bb75b826950"
                },
                "type": "document",
                "timestamp": "2025-06-19T12:04:05.185+10:00",
                "entry": [
                    {
                        "fullUrl": "urn:uuid:6522deaf-e894-42f4-b184-dbf286535f6a",
                        "resource": {
                            "resourceType": "Composition",
                            "id": "6522deaf-e894-42f4-b184-dbf286535f6a",
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
                                "reference": "urn:uuid:2b41acc8-2e68-49ac-aa2d-92ec95166017"
                            },
                            "date": "2025-06-19T12:04:05+10:00",
                            "author": [
                                {
                                    "reference": "urn:uuid:8a117966-f835-49c3-a5c6-0226aba5d406"
                                }
                            ],
                            "title": "MHR Generated Patient Summary - 19-June-2025 12:04 pm AEST",
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
                                        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">No problems or conditions recorded.</div>"
                                    },
                                    "emptyReason": {
                                        "coding": [
                                            {
                                                "system": "http://terminology.hl7.org/CodeSystem/list-empty-reason",
                                                "code": "unavailable"
                                            }
                                        ],
                                        "text": "No information available."
                                    }
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
                                        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">No allergies or intolerances recorded.</div>"
                                    },
                                    "emptyReason": {
                                        "coding": [
                                            {
                                                "system": "http://terminology.hl7.org/CodeSystem/list-empty-reason",
                                                "code": "unavailable"
                                            }
                                        ],
                                        "text": "No information available."
                                    }
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
                                        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">No medications recorded.</div>"
                                    },
                                    "emptyReason": {
                                        "coding": [
                                            {
                                                "system": "http://terminology.hl7.org/CodeSystem/list-empty-reason",
                                                "code": "unavailable"
                                            }
                                        ],
                                        "text": "No information available."
                                    }
                                }
                            ]
                        }
                    },
                    {
                        "fullUrl": "urn:uuid:2b41acc8-2e68-49ac-aa2d-92ec95166017",
                        "resource": {
                            "resourceType": "Patient",
                            "id": "2b41acc8-2e68-49ac-aa2d-92ec95166017",
                            "meta": {
                                "versionId": "1",
                                "lastUpdated": "2025-06-19T12:04:01.054+10:00",
                                "source": "#YtBAT0NsnPDH8Ka7"
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
                        "fullUrl": "urn:uuid:8a117966-f835-49c3-a5c6-0226aba5d406",
                        "resource": {
                            "resourceType": "Device",
                            "id": "8a117966-f835-49c3-a5c6-0226aba5d406",
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
                                "reference": "urn:uuid:b4625480-ea8d-4905-b7fb-52a725931231"
                            }
                        }
                    },
                    {
                        "fullUrl": "urn:uuid:b4625480-ea8d-4905-b7fb-52a725931231",
                        "resource": {
                            "resourceType": "Organization",
                            "id": "b4625480-ea8d-4905-b7fb-52a725931231",
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
                    }
                ]
            }
        }
    ]
}
```

