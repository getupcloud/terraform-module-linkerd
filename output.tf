output "ca_key" {
  sensitive = true
  value     = tls_private_key.linkerd_root_ca.private_key_pem
}

output "ca_crt" {
  value = tls_self_signed_cert.linkerd_root_ca.cert_pem
}

output "ca_crt_validity" {
  value = tls_self_signed_cert.linkerd_root_ca.validity_end_time
}

output "issuer_key" {
  sensitive = true
  value     = tls_private_key.linkerd_issuer.private_key_pem
}

output "issuer_crt" {
  value = tls_locally_signed_cert.linkerd_issuer.cert_pem
}

output "issuer_crt_validity" {
  value = tls_locally_signed_cert.linkerd_issuer.validity_end_time
}

output "issuer_crt_expiry" {
  value = tls_locally_signed_cert.linkerd_issuer.validity_end_time
}

output "config" {
  sensitive = true
  value = {
    ca_key            = tls_self_signed_cert.linkerd_root_ca.cert_pem
    ca_crt            = tls_self_signed_cert.linkerd_root_ca.cert_pem
    ca_crt_validity   = tls_self_signed_cert.linkerd_root_ca.validity_end_time
    issuer_key        = tls_private_key.linkerd_issuer.private_key_pem
    issuer_crt        = tls_locally_signed_cert.linkerd_issuer.cert_pem
    issuer_crt_expiry = tls_locally_signed_cert.linkerd_issuer.validity_end_time
  }
}

output "linkerd-viz-htpasswd" {
  sensitive = true
  value = local.linkerd-viz-enabled ? "${var.linkerd-viz.username}:${module.linkerd-viz-passwd[0].secret}" : ""
}
