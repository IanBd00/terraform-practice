variable "compartment_id" {
    type = string
}

variable "public_subnet_id" {
    type = string
}

variable "shape" {
    type = string
}

variable "ssh_public_key" {
  type = string
}

variable "instancename" {
  type        = string
  description = "Mapa de instâncias a criar. Chave = nome local, valor = display_name."
}


variable "ocpu" {
  type = string
}

variable "ram" {
  type = string
}