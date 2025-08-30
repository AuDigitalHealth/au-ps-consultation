The Agency has been actively exploring options to design an secure and scalable framework for discovering health information with MHR. One promising candidate is the use of [FHIR Named Queries](https://hl7.org/fhir/R4/search.html#query), which offer a flexible and powerful mechanism for data discovery.

FHIR Named Queries provide several key benefits:

- **Encapsulation of Complex Logic**: They are predefined, parameterised queries that encapsulate complex discovery logic, abstracting it away from the systems that execute them.
- **Data Custodian Control**: They allow data custodians to define precisely what data is exposed and how it is accessed.
- **Interoperability Across Repositories**: Named Queries can operate as a façade over multiple FHIR and non-FHIR repositories, enabling a unified, FHIR-compliant interface for interacting with heterogeneous data sources.
- **Extensible Discovery Patterns**: With thoughtful design, Named Queries can support open-ended discovery patterns. This means client systems can discover new content types without requiring changes, as long as those types are discoverable and can be provided as parameters.
- **Dual Capability – Discovery and Generation**: Named Queries can be used to discover existing content (e.g., uploaded documents) and also generate new content on-demand based on predefined algorithms and logic. This dual capability makes them highly versatile for dynamic and static data use cases.

For practical examples, refer to the [Find Content By Patient](OperationDefinition-find-content-by-patient.html) page, which demonstrates how Named Queries can be applied to generate Patient Summary documents from content stored in the My Health Record (MHR).
