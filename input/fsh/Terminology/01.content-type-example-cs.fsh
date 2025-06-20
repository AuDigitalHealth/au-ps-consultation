CodeSystem: ContentTypeExampleCS
Id: content-type-example-cs
Title: "Content Type Example - CodeSystem"
Description: "This is an example CodeSystem for supported content types by a system or an organisation. It is included in this Implementation Guide to demonstrate how building a hierarchical CodeSystem can be paired with a Named Query and be a powerful discovery pattern. The below is just for demonstration purposes. Widely adopted CodeSystems like LOINC or SNOMED CT are recommended."

* ^version = "0.1.0"
* ^caseSensitive = true
* ^hierarchyMeaning = #is-a

* ^property[0].code = #notSelectable
* ^property[=].uri = "http://hl7.org/fhir/concept-properties#notSelectable"
* ^property[=].description = "Indicates that the code is abstract - only intended to be used as a selector for other concepts"
* ^property[=].type = #boolean
* ^property[+].code = #status
* ^property[=].uri = "http://hl7.org/fhir/concept-properties#status"
* ^property[=].description = "Designation of a concept's state. Normally is not populated unless the state is retired."
* ^property[=].type = #code

* #_ClinicalDocument "ClinicalDocument" "This code is a generic concept that encompasses all clinical document."
* #_ClinicalDocument ^property[0].code = #notSelectable
* #_ClinicalDocument ^property[=].valueBoolean = true
* #_ClinicalDocument ^property[+].code = #status
* #_ClinicalDocument ^property[=].valueCode = #active

* #_ClinicalDocument #_SummaryDocument "SummaryDocuments" "This code is a generic concept that encompasses all summary documents."
* #_ClinicalDocument #_SummaryDocument ^property[+].code = #status
* #_ClinicalDocument #_SummaryDocument ^property[=].valueCode = #active

* #_ClinicalDocument #_SummaryDocument #DischargeSummary "DischargeSummary" "**Description:** Discharge summary document type"
* #_ClinicalDocument #_SummaryDocument #DischargeSummary ^property[0].code = #status
* #_ClinicalDocument #_SummaryDocument #DischargeSummary ^property[=].valueCode = #active

* #_ClinicalDocument #_SummaryDocument #PatientSummary "PatientSummary" "**Description:** Patient summary document type"
* #_ClinicalDocument #_SummaryDocument #PatientSummary ^property[0].code = #status
* #_ClinicalDocument #_SummaryDocument #PatientSummary ^property[=].valueCode = #active


* #_DiagnosticReport "DiagnosticReport" "Reports of diagnostic tests performed on patients."
* #_DiagnosticReport ^property[0].code = #notSelectable
* #_DiagnosticReport ^property[=].valueBoolean = true
* #_DiagnosticReport ^property[+].code = #status
* #_DiagnosticReport ^property[=].valueCode = #active

* #_DiagnosticReport #_PathologyReport "PathologyReport" "Reports from laboratory tests and pathology investigations."
* #_DiagnosticReport #_PathologyReport ^property[+].code = #status
* #_DiagnosticReport #_PathologyReport ^property[=].valueCode = #active

* #_DiagnosticReport #_PathologyReport #BloodTest "Blood Test" "Results from routine or specialised blood tests."
* #_DiagnosticReport #_PathologyReport #BloodTest ^property[+].code = #status
* #_DiagnosticReport #_PathologyReport #BloodTest ^property[=].valueCode = #active

* #_DiagnosticReport #_PathologyReport #Biochemistry "Biochemistry" "Reports detailing biochemical analysis of body fluids."
* #_DiagnosticReport #_PathologyReport #Biochemistry ^property[+].code = #status
* #_DiagnosticReport #_PathologyReport #Biochemistry ^property[=].valueCode = #active

* #_DiagnosticReport #_DiagnosticImagingReport "DiagnosticImagingReport" "Reports from imaging procedures such as X-rays and CT scans."
* #_DiagnosticReport #_DiagnosticImagingReport ^property[+].code = #status
* #_DiagnosticReport #_DiagnosticImagingReport ^property[=].valueCode = #active

* #_DiagnosticReport #_DiagnosticImagingReport #XRay "X-Ray" "Radiology report based on X-ray imaging."
* #_DiagnosticReport #_DiagnosticImagingReport #XRay ^property[+].code = #status
* #_DiagnosticReport #_DiagnosticImagingReport #XRay ^property[=].valueCode = #active

* #_DiagnosticReport #_DiagnosticImagingReport #CTScan "CT Scan" "Radiology report based on computed tomography imaging."
* #_DiagnosticReport #_DiagnosticImagingReport #CTScan ^property[+].code = #status
* #_DiagnosticReport #_DiagnosticImagingReport #CTScan ^property[=].valueCode = #active