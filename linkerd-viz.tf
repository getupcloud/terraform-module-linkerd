module "linkerd-viz-passwd" {
  count  = local.linkerd-viz-enabled != "" ? 1 : 0
  source = "github.com/getupcloud/terraform-module-password?ref=v0.1.0"

  algorithm  = "bcrypt"
  plain_text = var.linkerd-viz.password
}
