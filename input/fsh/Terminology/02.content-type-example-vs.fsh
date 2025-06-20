ValueSet: ContentTypeExampleVS
Id: content-type-example-vs
Title: "Content Type Example - ValueSet"
Description: "This is an example ValueSet for supported content types by a system or an organisation. In the context of this Implementation Guide, the intention is for it to be associated with a discovery named query. Client systems should be able to $expand this ValueSet dynamically to discover the content types supported for discovery. If the content is then represented as documents that are rendered in a consistent manner, client systems wouldn't need to change to support new content types, as long as they are included in this ValueSet."

* ^version = "0.1.0"
* ^experimental = false
* include codes from system ContentTypeExampleCS