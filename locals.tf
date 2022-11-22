locals {
  linkerd-viz-enabled = (var.linkerd-viz.username != "" && var.linkerd-viz.password != "")
}
