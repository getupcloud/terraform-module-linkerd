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
}
