variable "domain_name" {
  type        = string
  description = "The domain to use to generate the certificates"
}

variable "lookup_zone" {
  type        = string
  description = "The zone to use to lookup the domain"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the resources"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "The subject alternative names to use for the certificate"
  default     = []
}