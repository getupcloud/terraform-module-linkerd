## CA CERTIFICATE

resource "tls_private_key" "linkerd_root_ca" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "tls_self_signed_cert" "linkerd_root_ca" {
  private_key_pem = tls_private_key.linkerd_root_ca.private_key_pem

  subject {
    common_name = "root.linkerd.cluster.local"
  }

  early_renewal_hours   = 24 * 30
  validity_period_hours = 24 * 365 * 10
  is_ca_certificate     = true

  allowed_uses = [
    "cert_signing",
    "crl_signing"
  ]
}

## INTERMEDIATE CERTIFICATE

resource "tls_private_key" "linkerd_issuer" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "tls_cert_request" "linkerd_issuer" {
  private_key_pem = tls_private_key.linkerd_issuer.private_key_pem

  subject {
    common_name = "identity.linkerd.cluster.local"
  }
}

resource "tls_locally_signed_cert" "linkerd_issuer" {
  cert_request_pem   = tls_cert_request.linkerd_issuer.cert_request_pem
  ca_private_key_pem = tls_private_key.linkerd_root_ca.private_key_pem
  ca_cert_pem        = tls_self_signed_cert.linkerd_root_ca.cert_pem

  early_renewal_hours   = 24 * 30
  validity_period_hours = 24 * 365 * 10
  is_ca_certificate     = true

  allowed_uses = [
    "cert_signing",
    "crl_signing"
  ]
}
