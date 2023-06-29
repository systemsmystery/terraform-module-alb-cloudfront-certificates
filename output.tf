output "alb_cert_arn" {
  value       = aws_acm_certificate.cert_alb.arn
  description = "The ARN of the ACM certificate for the ALB"
}

output "cloudfront_cert_arn" {
  value       = aws_acm_certificate.cert.arn
  description = "The ARN of the ACM certificate for CloudFront"
}