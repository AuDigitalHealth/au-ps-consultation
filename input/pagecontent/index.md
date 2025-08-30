# MHR AU PS

> {% include disclaimers-mhr-aups.md %}

### Introduction

The Australian Digital Health Agency (the Agency) is exploring opportunities to leverage the wealth of patient data within My Health Record (MHR) to support unplanned continuity of care use cases. One promising approach is the generation of a **Patient Summary document** from MHR content. This document would not only include clinician-authored data but also incorporate a patient-curated story—capturing the individual’s voice, cultural identity, and personal health goals.

This approach transforms the patient summary from a purely clinical document into a person-centred healthcare tool. By providing care providers with access to both clinical information and meaningful contextual insights, these enhanced summaries enable more informed, culturally sensitive, and personalised care decisions—particularly crucial when patients receive care outside their usual healthcare network.

The Agency recognises and builds upon the foundational work of the Australian digital health community in developing the [AU Patient Summary](https://build.fhir.org/ig/hl7au/au-fhir-ps/). This collaborative foundation provides the Agency with a robust platform to explore how MHR data can be strategically leveraged to advance unplanned continuity of care across Australia's healthcare ecosystem.

### Business Scenario

This Implementation Guide is built around a modified version of the [Interstate GP Visit Use Case](https://build.fhir.org/ig/hl7au/au-fhir-ps/uc-interstate.html), adapted to reflect the role of MHR in the Australian healthcare ecosystem. The scenario emphasises capturing the patient's story, goals, cultural identity, and values alongside clinical data.

For the complete business scenario, including the detailed patient journey from summary generation to clinical care delivery, see the [Business Scenario](business-scenario.html) page.

### What the Agency Aims to Achieve from This Implementation Guide

The Agency is committed to supporting and building upon the important work already undertaken by the Australian digital health community in developing the AU Patient Summary. This Implementation Guide serves as an opportunity to contribute to that collective effort and explore how MHR can further enhance its value.

Through this Implementation Guide, the Agency seeks to gather early feedback on key design aspects of the Patient Summary concept. As use cases and requirements continue to evolve, this list of focus areas will also evolve. The current areas of particular focus include:

- **Generation** – How systems can invoke MHR to generate a Patient Summary document.
- **Patient Story** – How patients can contribute their own narratives, goals, and cultural context.
- **Persistence** – Whether and how the generated document should be stored within MHR.
- **Provenance** – How the origin and context of information can be safely and clearly represented.
- **SMART Health Links** – How [SMART Health Links](https://build.fhir.org/ig/HL7/smart-health-cards-and-links/index.html) may be leveraged to increase the reach of Patient Summary.

While the following areas are still evolving internally and are not the primary focus of this Implementation Guide, the Agency also welcomes feedback on:
- The algorithm used to generate the Patient Summary from available content.
- The detailed structure and design of the FHIR profiles, which are expected to align with established community processes.

Please provide any feedback through the [Github Repository](https://github.com/AuDigitalHealth/au-ps-consultation/issues) of this Implementation Guide.

### How to read this guide

This guide is divided into several pages which are listed at the top of each page in the menu bar. To get the most value from this guide, we recommend the following reading path:

1. Start with [this page](index.html) to understand the overall context and objectives, then review the [Business Scenario](business-scenario.html) page to familiarise yourself with the detailed patient journey. Much of the content in this guide refers back to the business scenario for context and illustration.
2. There are five key design principles that this guide aims to socialise and get feedback on:
   1. [Generation](design-generation.html): How can users and systems request My Health Record (MHR) to generate a Patient Summary document?
   2. [Curation of Patient Story](design-capturing-patient-story.html): How will MHR allow patients to capture and share their stories in their own voices and share them with healthcare providers?
   3. [Persistence](design-persistence.html): Should the generated Patient Summary document be persisted in MHR? What are the implications of persisting or not persisting it?
   4. [Provenance](design-provenance.html): How can the sources and original context of information in the Patient Summary be safely and clearly tracked and presented?
   5. [Access](design-access.html): Explore a pattern where patients can share their summaries with healthcare providers with minimal software requirements.
3. Review the [FHIR Artefacts](artifacts.html) section to understand the technical components, including:
   1. The use of the [Find Content by Patient](OperationDefinition-find-content-by-patient.html) named query.
   2. A list of [examples](examples.html) synthesised and used in this Implementation Guide.
4. Follow the [guidance](testing-guidance.html) on how to interact with the FHIR server for the purposes of this Implementation Guide.

> Note: Uploading a Patient Summary document to My Health Record is not supported at this time.

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