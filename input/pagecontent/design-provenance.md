### Provenance

An initial design for a [MHR AU PS Provenance profile](StructureDefinition-mhr-au-ps-provenance.profile.json.html) is available in this Implementation Guide, and the Agency welcomes feedback from the community.

The **Provenance resource** plays a critical role in the MHR-generated Patient Summary document. It is used to track the **original source and context** of the information included in the generated summary. This ensures transparency, traceability, and accountability for the data presented to clinicians and patients.

### Key Components of the Provenance Profile

The current design includes four main components:

- **`target`**  
  Refers to the data being tracked by the Provenance resource. This is typically the specific element or resource within the Patient Summary that originated from another source.

- **`agent.author`**  
  Represents the author of the original data. At this stage, the default assumption is that this refers to the **author of the document** from which the data was sourced.  
  > ⚠️ Many FHIR resources also have their own `author` elements. A key design consideration is whether to use the author of the **resource** or the author of the **document**. This needs further discussion and input.

- **`agent.custodian`**  
  Identifies the custodian of the original document or data source. This is typically the organisation or system responsible for maintaining the source data.

- **`entity.source`**  
  Points to the **original source** of the data. In most cases, this will be another document within MHR.  
  > To avoid bloating the Patient Summary, the full content of the source document is not included. Instead, the **identifier** and **title** of the source document are recorded. This allows the document to be retrieved if needed, without embedding it directly.

### Design Considerations

The use of Provenance in this context raises several important questions:

- How should authorship be handled when both the document and the resource have authors?
- Should multiple Provenance records be created for different levels of granularity of tracking sources of data (e.g., per document or per resource within a document)?
- How can we ensure that Provenance remains useful without overwhelming the Patient Summary with metadata?
- Is it sufficient to rely on the integrity of the MHR infrastructure as a trusted source or is there a need for digital signature or something similar?
- Is there a need to render any of the content of the Provenance for end users accessing the generated Patient Summary document?

These are active areas of exploration, and the Agency is keen to ensure that the Provenance model is both **technically sound** and **clinically meaningful**.

---

The Agency welcomes **feedback and suggestions** on this important design area. Your input will help shape a Provenance model that supports safe, transparent, and trustworthy use of MHR data in unplanned care.
