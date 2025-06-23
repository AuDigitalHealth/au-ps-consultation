### Testing Guidance

This page provides guidance for participants in the Sparked Testing Event, including key artefacts, assumptions, and setup notes.

---

### Key Artefacts

1. **Agency FHIR Test Server**  
   A demo FHIR server has been provisioned specifically for this testing event:  
   👉 https://agency-sparked-testing.com/fhir/  
   This server is intended to support testing of the [FindContent By Patient](OperationDefinition-find-content-by-patient.html)Named Query.  
   > ⚠️ Please note: This is a **temporary test server**. It may be unavailable at times, and no conclusions should be drawn about the Agency’s future direction based on its configuration.

2. **Postman Collection**  
   A Postman collection is available in the GitHub repository associated with this Implementation Guide. It can be accessed from . The collection provides example requests and workflows to support testing activities.

3. **IPS Viewer**
   The [IPS Viewer](https://www.ipsviewer.com/) can be a very useful tool to render the generated MHR Patient Summary document. Make sure you copy the `document` Bundle within the resulting `searchset` Bundle from the Named Query.

---

## Assumptions

1. **FHIR Document Uploads for Testing**  
   For the purposes of this event, it is assumed that the content required to generate the Patient Summary document is uploaded as **FHIR documents**.  
   In a real-world MHR scenario, this content would typically be in **CDA format**. One of the strengths of the FHIR Named Queries is that they abstract away the original format of the data, allowing for consistent access regardless of source format.

2. **Patient Story Section**  
   The Patient Story section assumes that patients or their carers can add annotations—such as personal stories and health goals—via a conformant portal. While this is not yet part of the final design, it is being actively explored. To support this scenario in testing, we assume that a Patient Summary document can be uploaded to MHR. This is not yet confirmed as a supported feature, but it enables testing of the Patient Story concept.

---

### How to Follow Along with the Postman Collection

1. **Create `composition.patient.identifier` Search Parameter**  
   The first request in the collection creates a custom Search Parameter used by the Named Query.  
   > You do not need to execute this request—**the Agency will run it once** on the test server.  
   It’s included to highlight that the logic of the Named Query relies on the `Patient.identifier` to locate relevant documents. This identifier must match the one provided as a parameter when executing the query.

2. **Create a Patient Resource**  
   The second request provides an example Patient resource.  
   - If you plan to upload documents for testing, please create your own Patient resource.  
   - Refer to the [MHR AU PS Patient](StructureDefinition-mhr-au-ps-patient.html) profile.  
   - The patient **must have an IHI** and the **same Patient resource must be used** across all uploaded documents for them to be included in the generated Patient Summary.  
   > If you only want to test the Named Query using the preloaded patient "Mia", you can skip this step.

3. **Upload Discharge Summary**  
   This request uploads a document that contains **no atomic FHIR resources**—only narrative.  
   - By design, this document will **not contribute** to the generated Patient Summary.  
   - While future enhancements may allow extracting structured data from narrative, this is **not currently supported**.

4. **Upload Shared Health Summary, AIR Document, and Event Summary**  
   These are example documents that include **atomic FHIR resources**. They will be included in the Patient Summary if they meet two conditions:  
   - The `Composition.subject.identifier` matches the `Patient.identifier` used in the Named Query.  
   - The document contains FHIR resources relevant to the **requested sections**.  
     For example, the AIR document includes Immunisation data. If the `section-lookback` parameter does not request the Immunisation section, the AIR document will not be included.  
   > Also note the **default lookback period** if none is specified. These details are covered in the Named Query documentation.

5. **Upload Patient-Annotated Patient Summary Document**  
   If this request is executed and the **Patient Story** section is requested, the patient’s annotations (e.g. story and goals) will be included in the generated summary.

6. **Find Resources Within the Document**  
   This request demonstrates that the FHIR server does **not store atomic FHIR resources** from uploaded documents by default.  
   - The Named Query logic is responsible for extracting and assembling these resources at runtime.
