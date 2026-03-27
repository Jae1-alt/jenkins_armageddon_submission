variable "s3-objects" {
  type = map(object({
    key          = string
    source       = string
    content_type = string
  }))

  description = "The different objects to upload to the bucket."

  default = {
    "sample_image_1" = {
      key          = "images/sample_image.png"
      source       = "./images/sample_image.png"
      content_type = "image/png"
    }
    "armageddon_confirmation" = {
      key          = "images/armageddon_pass_confirm.png"
      source       = "./images/armageddon_pass_confirm.png"
      content_type = "image/png"
    }
    "webhook_settings" = {
      key          = "images/webhook_settings.png"
      source       = "./images/webhook_settings.png"
      content_type = "image/png"
    }
    "webhook_payload_delivery" = {
      key          = "images/webhook_payload_delivered.png"
      source       = "./images/webhook_payload_delivered.png"
      content_type = "image/png"
    }
  }
}
