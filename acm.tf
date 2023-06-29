resource "aws_acm_certificate" "cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = var.subject_alternative_names
  lifecycle {
    create_before_destroy = true
  }
  provider = aws.aws_us_east_1
}

resource "aws_acm_certificate" "cert_alb" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}


data "aws_route53_zone" "zone" {
  name     = var.lookup_zone
  provider = aws.aws_us_east_1_dns
}

resource "aws_route53_record" "cert_records" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.zone_id
  provider        = aws.aws_us_east_1_dns
}

resource "aws_route53_record" "cert_records_alb" {
  for_each = {
    for dvo in aws_acm_certificate.cert_alb.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.zone_id
  provider        = aws.aws_us_east_1_dns
}