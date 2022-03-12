
resource "aws_route53_record" "root_txt" {
  name            = var.route53_zone_name
  zone_id         = var.route53_zone_id
  allow_overwrite = true
  type            = "TXT"
  ttl             = var.record_ttl
  records         = var.root_txt
}

resource "aws_route53_record" "dmarc" {
  name            = "_dmarc.${var.route53_zone_name}"
  zone_id         = var.route53_zone_id
  allow_overwrite = true
  type            = "TXT"
  ttl             = var.record_ttl
  records         = var.dmarc_txt
}

resource "aws_route53_record" "mx" {
  name            = var.route53_zone_name
  zone_id         = var.route53_zone_id
  allow_overwrite = true
  type            = "MX"
  ttl             = var.record_ttl
  records         = var.mx_list
}

resource "aws_route53_record" "dkim_catchall" {
  name            = "*._domainkey.${var.route53_zone_name}"
  zone_id         = var.route53_zone_id
  allow_overwrite = true
  type            = "TXT"
  ttl             = var.record_ttl
  records         = var.dkim_catchall
}

resource "aws_route53_record" "caa" {
  name            = var.route53_zone_name
  zone_id         = var.route53_zone_id
  allow_overwrite = true
  type            = "CAA"
  ttl             = var.record_ttl
  records         = var.caa_list
}


