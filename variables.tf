variable "linkerd-viz" {
  description = "Linkerd Viz plain password"
  type = object({
    username = string
    password = string
  })

  default = {
    username = ""
    password = ""
  }

  validation {
    condition = (
      var.linkerd-viz.username == "" && var.linkerd-viz.password == ""
      ) || (
      var.linkerd-viz.username != "" && var.linkerd-viz.password != ""
    )
    error_message = "Either none or both vars linkerd-viz.username and linkerd-viz.password must be defined."
  }
}
