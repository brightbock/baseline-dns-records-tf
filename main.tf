
data "aws_route53_zone" "zone_info" {
  for_each = toset(var.route53_zone_name)
  name     = each.key
}

resource "aws_route53_record" "root_txt" {
  for_each        = toset(var.route53_zone_name)
  name            = data.aws_route53_zone.zone_info[each.key].name
  zone_id         = data.aws_route53_zone.zone_info[each.key].zone_id
  allow_overwrite = true
  type            = "TXT"
  ttl             = var.record_ttl
  records         = var.root_txt
}

resource "aws_route53_record" "dmarc" {
  for_each        = toset(var.route53_zone_name)
  name            = "_dmarc.${data.aws_route53_zone.zone_info[each.key].name}"
  zone_id         = data.aws_route53_zone.zone_info[each.key].zone_id
  allow_overwrite = true
  type            = "TXT"
  ttl             = var.record_ttl
  records         = var.dmarc_txt
}

resource "aws_route53_record" "mx" {
  for_each        = toset(var.route53_zone_name)
  name            = data.aws_route53_zone.zone_info[each.key].name
  zone_id         = data.aws_route53_zone.zone_info[each.key].zone_id
  allow_overwrite = true
  type            = "MX"
  ttl             = var.record_ttl
  records         = var.mx_list
}

resource "aws_route53_record" "dkim_catchall" {
  for_each        = toset(var.route53_zone_name)
  name            = "*._domainkey.${data.aws_route53_zone.zone_info[each.key].name}"
  zone_id         = data.aws_route53_zone.zone_info[each.key].zone_id
  allow_overwrite = true
  type            = "TXT"
  ttl             = var.record_ttl
  records         = var.dkim_catchall
}

resource "aws_route53_record" "caa" {
  for_each        = toset(var.route53_zone_name)
  name            = data.aws_route53_zone.zone_info[each.key].name
  zone_id         = data.aws_route53_zone.zone_info[each.key].zone_id
  allow_overwrite = true
  type            = "CAA"
  ttl             = var.record_ttl
  records         = var.caa_list
}


