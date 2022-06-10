output "root_ca_key" {
  value     = tls_private_key.linkerd_root_ca.private_key_pem
  sensitive = true
}

output "root_ca_crt" {
  value = tls_self_signed_cert.linkerd_root_ca.cert_pem
}

output "issuer_key" {
  value     = tls_private_key.linkerd_issuer.private_key_pem
  sensitive = true
}

output "issuer_crt" {
  value = tls_locally_signed_cert.linkerd_issuer.cert_pem
}
