# Baseline DNS records

This is a Terrafrom module to set baseline DNS records in a Route53 zone.

Records created:

1. DMARC (`_dmarc.example.com TXT ...`)
2. MX (`example.com MX ...`)
3. DKIM catch-unused (`*._domainkey.example.com TXT ...`)
4. CAA (`example.com CAA ...`)
5. TXT for SPF (`example.com TXT ...`)

The default values in [variables.tf](./variables.tf) follow suggestions from the [UK National Cyber Security Centre](https://www.ncsc.gov.uk/blog-post/protecting-parked-domains) for parked domains, to help prevent use in email spoofing/phishing attacks.

The default `CAA` value prohibits all certificate issuance.

## How to use:

1. Add a module definition to your Terraform. See the example below.
2. Update `route53_zone_name = ...` to match your zone name.
3. Optional: Uncomment and update the other example values to match your requirements.

```
module "baseline-dns-records" {
  source = "git::https://github.com/brightbock/baseline-dns-records-tf.git?ref=v0.2.0"
  
  route53_zone_name = "example.com"

  #caa_list = [
  #  "0 issue \"amazon.com\"",
  #  "0 issue \"amazonaws.com\"",
  #  "0 issue \"amazontrust.com\"",
  #  "0 issue \"awstrust.com\""
  #]

  #dmarc_txt = ["v=DMARC1; p=reject; sp=reject;"]

  #root_txt = [
  #  "v=spf1 include:_spf.google.com ~all",
  #  "foo=bar"
  #]

  #mx_list = [
  #  "1 aspmx.l.google.com",
  #  "5 alt1.aspmx.l.google.com",
  #  "5 alt2.aspmx.l.google.com",
  #  "10 alt3.aspmx.l.google.com",
  #  "10 alt4.aspmx.l.google.com"
  #]
}
```

### Warning:

This module will overwrite corresponding records that already exist. Please take care to set appropriate values, especially for `mx_list` and `root_txt`.
