The Agency has been exploring options to design an efficient and open-ended framework for discovering health information. One candidate that the Agency see a lot of potential in is the [FHIR Named Queries](https://hl7.org/fhir/R4/search.html#query). There are multiple benefits for FHIR Named Queries that include:
- They are predefined paramterised queries so they allow complex discvoery logic to be encapsulated and abstratcted from systems executing them.
- They give control on how/ what data to expose by the custodian of the data
- They can sit on a facad on top of multiple FHIR and non-FHIR repositories and allow a FHIR compliant way for interacting with all of the repositories
- A well-thought and well-designed named query can allow open-ended extended discovery pattern where the client system don't need to change to disover and render new content type. Please refer to OperationDefinition-discover-content-by-patient.html for some practical examples

The Agency has been actively exploring options to design an efficient, scalable, and open-ended framework for discovering health information across diverse systems. One promising candidate is the use of [FHIR Named Queries](https://hl7.org/fhir/R4/search.html#query), which offer a flexible and powerful mechanism for data discovery.

FHIR Named Queries provide several key benefits:

- **Encapsulation of Complex Logic**: They are predefined, parameterised queries that encapsulate complex discovery logic, abstracting it away from the systems that execute them.
- **Data Custodian Control**: They allow data custodians to define precisely what data is exposed and how it is accessed.
- **Interoperability Across Repositories**: Named Queries can operate as a façade over multiple FHIR and non-FHIR repositories, enabling a unified, FHIR-compliant interface for interacting with heterogeneous data sources.
- **Extensible Discovery Patterns**: With thoughtful design, Named Queries can support open-ended discovery patterns. This means client systems can discover new content types without requiring changes, as long as those types are discoverable and can be provided as parameters.
- **Dual Capability – Discovery and Generation**: Named Queries can be used to discover existing content (e.g., uploaded documents) and also generate new content on-demand based on predefined algorithms and logic. This dual capability makes them highly versatile for dynamic and static data use cases.

For practical examples, refer to the [Find Content By Patient](OperationDefinition-find-content-by-patient.html) page, which demonstrates how Named Queries can be applied to generate Patient Summary documents from content stored in the My Health Record (MHR).
