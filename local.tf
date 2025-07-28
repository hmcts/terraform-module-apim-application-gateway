locals {
  gateways = yamldecode(data.local_file.configuration.content).gateways

  ssl_certs = flatten([
    for gateways, gateway in local.gateways : [
      for cert in gateway.ssl_certificates : {
        name = "${cert.certificate_name}"
      }
    ]
  ])

  default_ssl_policy = {
    disabled_protocols   = null
    policy_type          = "Predefined"
    policy_name          = "AppGwSslPolicy20220101"
    cipher_suites        = null
    min_protocol_version = null
  }
  ssl_policy = var.ssl_policy != null ? var.ssl_policy : local.default_ssl_policy
}
