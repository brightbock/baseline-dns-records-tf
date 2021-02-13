variable "route53_zone_name" {
  type        = set(string)
  description = "The zone, as defined in AWS Route53"
}

variable "record_ttl" {
  type        = number
  description = "TTL to set on DNS records"
  default     = "600"
}

variable "caa_list" {
  type        = set(string)
  description = "CAA records to apply to zone root"
  default     = ["0 issue \";\""]
}

variable "root_txt" {
  type        = set(string)
  description = "TXT records to apply to zone root"
  default     = ["v=spf1 -all"]
}

variable "dkim_catchall" {
  type        = set(string)
  description = "Catch all DKIM record i.e. DKIM record with a blank key"
  default     = ["v=DKIM1; p="]
}

variable "mx_list" {
  type        = set(string)
  description = "MX records to apply to zone root"
  default     = ["0 ."]
}

variable "dmarc_txt" {
  type        = set(string)
  description = "DMARC records to apply to zone"
  default     = ["v=DMARC1; p=reject; sp=reject;"]
}

