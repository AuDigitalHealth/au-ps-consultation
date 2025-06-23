### Document Persistence

The **MHR-generated Patient Summary document** is not currently designed to be persisted. Instead, it is intended to be generated **on demand**, using the most up-to-date information available in My Health Record (MHR) at the time of access.

Persisting the generated document introduces several risks and complexities. For example:

- If a source document in MHR is **removed**, **updated**, or has its **access controls changed**, the persisted Patient Summary may become **outdated** or **inappropriately accessible**.
- Keeping the persisted version in sync with the source data would be **technically challenging**, especially in scenarios where access permissions evolve over time.
- There is a risk that clinicians or systems may rely on a version of the summary that no longer reflects the patient’s current health status or privacy preferences.

Despite these concerns, it is acknowledged that **clinical decisions may be made** based on a generated Patient Summary. In such cases, maintaining a **reference to the version used** could be important for clinical audit, medico-legal purposes, or continuity of care.

This presents a **tricky balance** between data integrity, privacy, and clinical utility.

### Potential Approaches

Several options are being considered to address this challenge:

- **Do not persist the document**  
  Always generate it fresh from MHR. This ensures the data is current but may limit traceability.

- **Persist with restricted access**  
  Store the document but only allow access through a controlled, back-office or manual process (e.g., for audit or legal review).

- **Conditional persistence**  
  Persist the document, but make it **automatically unavailable** if any contributing source document is changed, removed, or has its access controls updated.

- **Metadata-only persistence**  
  Instead of storing the full document, retain a **reference or metadata** (e.g., timestamp, contributing documents, hash) to indicate what was used at the time of generation.

Each of these options has trade-offs, and further consultation with clinical, legal, and privacy stakeholders will be important in determining the most appropriate path forward.

---

The Agency welcomes **feedback and input** from the community on this critical design decision. Your insights will help ensure that the approach taken is both **clinically sound** and **privacy-conscious**.
