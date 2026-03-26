variable "s3-objects" {
  type = map(object({
    key          = string
    source       = string
    content_type = string
  }))

  description = "The different objects to upload to the bucket."

  default = {
    "sample_image_1" = {
      key          = "sample_image.png"
      source       = "./images/sample_image.png"
      content_type = "image/png"
    }

  }
}
