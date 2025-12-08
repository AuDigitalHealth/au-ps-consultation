## MHR Summary Operation

The `$summary` operation generates an MHR Patient Summary document from the My Health Record (MHR) system. The operation is invoked on the Patient resource type and returns a Bundle containing the patient summary structured according to Australian Patient Summary (AU PS) standards.

### Parameters

#### identifier (required)

Patient identifier using IHI system.

- Type: Identifier
- Must include both system and value (e.g., `http://ns.electronichealth.net.au/id/hi/ihi/1.0|8003608166690003`)

#### section-beginDate (optional, repeatable)

Defines the start date for retrieving information for specific sections.

- Multiple parameters can be provided for different sections
- If not provided, all available data is included
- Contains two parts:
  - `section`: CodeableConcept identifying the section
  - `date`: DateTime specifying the begin date

#### exclude-section (optional, repeatable)

Specifies sections to exclude from the summary.

- Type: CodeableConcept
- Only optional sections can be excluded
- Bound to excludable sections value set

#### context (required)

Specifies the clinical context for summary generation.

- Type: CodeableConcept
- Helps tailor content to specific use cases
- Bound to summary context value set

### Example Request

```json
POST [base]/Patient/$summary
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "identifier",
      "valueIdentifier": {
        "system": "http://ns.electronichealth.net.au/id/hi/ihi/1.0",
        "value": "8003608333647261"
      }
    },
    {
      "name": "section-beginDate",
      "part": [
        {
          "name": "section",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://loinc.org",
                "code": "11450-4"
              }
            ]
          }
        },
        {
          "name": "date",
          "valueDateTime": "2022-01-01"
        }
      ]
    },
    {
      "name": "section-beginDate",
      "part": [
        {
          "name": "section",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://loinc.org",
                "code": "10160-0"
              }
            ]
          }
        },
        {
          "name": "date",
          "valueDateTime": "2024-01-01"
        }
      ]
    },
    {
      "name": "exclude-section",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://loinc.org",
            "code": "11369-6"
          }
        ]
      }
    },
    {
      "name": "exclude-section",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://loinc.org",
            "code": "47519-4"
          }
        ]
      }
    },
    {
      "name": "context",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://ns.electronichealth.net.au/fhir/CodeSystem/summary-context-codesystem",
            "code": "unplanned-continuity-of-care"
          }
        ]
      }
    }
  ]
}
```

### Response

Returns a Bundle resource containing the MHR Patient Summary document with a Composition resource and referenced clinical resources.
