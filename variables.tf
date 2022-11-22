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
    error_message = "linkerd-viz:e either none or both vars username and password must be defined."
  }
}
