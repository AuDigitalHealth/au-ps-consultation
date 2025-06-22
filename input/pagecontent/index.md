# Agency AU PS Sparked Testing

> {% include declaimers-sparked-testing.md %}

### Introduction

The Australian Digital Health Agency (the Agency) is exploring opportunities to leverage the wealth of patient data within My Health Record (MHR) to support unplanned continuity of care use cases. One promising approach is the generation of a **Patient Summary document** from MHR content. This document would not only include clinician-authored data but also incorporate a patient-curated story—capturing the individual’s voice, cultural identity, and personal health goals.

This approach aims to enhance the relevance and person-centredness of the summary, ensuring that care providers have access to both clinical and contextual information that may influence care decisions.

The Agency acknowledges the significant contributions made by the Australian digital health community in shaping the [AU Patient Summary](https://build.fhir.org/ig/hl7au/au-fhir-ps/). This work provides a strong foundation for the Agency to explore the potential of MHR data in supporting unplanned transition of care.

### Business Scenario

This Implementation Guide is built around a modified version of the [Interstate GP Visit Use Case](https://build.fhir.org/ig/hl7au/au-fhir-ps/uc-interstate.html). The scenario has been adapted to reflect the role of MHR in the Australian healthcare ecosystem, with additional emphasis on capturing the patient’s story, goals, cultural identity, and values.

#### Scenario Overview:

Before departing for a holiday in Queensland, Mia—a resident of Sydney—logs into her My Health Record and generates a Patient Summary document. She reviews the clinical content sourced from documents submitted by her healthcare providers and adds personal annotations. Mia also contributes her own narrative, outlining her health goals, cultural background, and personal story.

While in North Queensland, Mia experiences a health issue and visits a local GP. The GP accesses her My Health Record and retrieves Mia's Patient Summary. In addition to structured clinical data—such as medications, allergies, and immunisations—the summary includes Mia’s patient-curated story. This narrative offers valuable insight into her preferences, values, and cultural context, helping the GP deliver care that is respectful, informed, and tailored to Mia’s needs.

This enriched summary supports more effective and person-centred care, particularly in situations where the patient is unfamiliar to the provider and continuity of care is limited.

### What the Agency Aims to Achieve from This Testing Event

The Agency is committed to supporting and building upon the important work already undertaken by the Australian digital health community in developing the AU Patient Summary. This testing event is seen as an opportunity to contribute to that collective effort and explore how MHR can further enhance its value.

Through participation in the Sparked Testing event, the Agency seeks to gather early feedback on key design aspects of the Patient Summary concept. In particular, the focus is on:

- **Generation** – How will systems invoke MHR to generate a Patient Summary document.
- **Patient Story** – How patients can contribute their own narratives, goals, and cultural context.
- **Persistence** – Whether and how the generated document should be stored within MHR.
- **Provenance** – How the origin and context of information can be safely and clearly represented.

While the following areas are still evolving internally and are not the main focus of this testing event, the Agency also welcomes feedback on:
- The algorithm used to generate the Patient Summary from available content.
- The detailed structure and design of the FHIR profiles, which are expected to align with established community processes.

Please, provide any feedback through the [Github Repository](https://github.com/AuDigitalHealth/sparked-testing/issues) of this Implementation Guide.

### How to read this guide?

This guide is divided into several pages which are listed at the top of each page in the menu bar. To get the most value from this guide, we recommend the following reading path:

1. Start with [this page](index.html) to familiarise yourself with the business scenario. Much of the content in this guide refers back to it for context and illustration.
2. There are four key design principles that this guide aims to socialise and get feedback on:
   1. [Generation](design-generation.html): How can users and systems request My Health Record (MHR) to generate a Patient Summary document?
   2. [Curation of Patient Story](design-capturing-patient-story.html): How will MHR allow patients to capture and share their stories in their own voices and share them with healthcare providers?
   3. [Persistence](design-persistence.html): Should the generated Patient Summary document be persisted in MHR? What are the implications of persisting or not persisting it?
   4. [Provenance](design-provenance.html): How can the sources and original context of information in the Patient Summary be safely and clearly tracked and presented?
3. Review the [FHIR Artefacts](artifacts.html) section to understand the technical components, including:
   1. The use of the [Find Content by Patient](OperationDefinition-find-content-by-patient.html) named query.
   2. A list of [examples](examples.html) synthesised and used in this Implementation Guide.
4. Follow the [guidance](testing-guidance.html) on how to interact with the FHIR server for the purposes of the Sparked Testing event.

> Note: Uploading a Patient Summary document to My Health Record is out of scope for this testing event.



### Relationships with other work

This implementation guide builds on other specifications, helping ensure a consistent approach to data sharing that should ease adoption. The specific guides used, and the portions relevant from each of them are as follows:

{% include dependency-table-short.xhtml %}

### Cross version analysis

{% include cross-version-analysis.xhtml %}

### Global profiles

{% include globals-table.xhtml %}

### Intellectual property considerations

This implementation guide and the underlying FHIR specification are licensed as public domain under the [FHIR license](http://hl7.org/fhir/R4/license.html). The license page also describes rules for the use of the FHIR name and logo.

{% include ip-statements.xhtml %}