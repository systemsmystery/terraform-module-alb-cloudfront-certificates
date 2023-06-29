# Module - ALB Cloudfront ACM

This module provides ACM certificate for Cloudfront and ALB.

## Terraform Resources

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.4.0 |
| <a name="provider_aws.aws_us_east_1"></a> [aws.aws\_us\_east\_1](#provider\_aws.aws\_us\_east\_1) | 5.4.0 |
| <a name="provider_aws.aws_us_east_1_dns"></a> [aws.aws\_us\_east\_1\_dns](#provider\_aws.aws\_us\_east\_1\_dns) | 5.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate.cert_alb](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/acm_certificate) | resource |
| [aws_route53_record.cert_records](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/route53_record) | resource |
| [aws_route53_record.cert_records_alb](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/5.4.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain to use to generate the certificates | `string` | n/a | yes |
| <a name="input_lookup_zone"></a> [lookup\_zone](#input\_lookup\_zone) | The zone to use to lookup the domain | `string` | n/a | yes |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | The subject alternative names to use for the certificate | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply to the resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_cert_arn"></a> [alb\_cert\_arn](#output\_alb\_cert\_arn) | The ARN of the ACM certificate for the ALB |
| <a name="output_cloudfront_cert_arn"></a> [cloudfront\_cert\_arn](#output\_cloudfront\_cert\_arn) | The ARN of the ACM certificate for CloudFront |
<!-- END_TF_DOCS -->
