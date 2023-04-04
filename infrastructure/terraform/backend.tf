terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      # source = "terraform-registry.storage.yandexcloud.net/yandex-cloud/yandex" # Alternate link
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "momo-store-terraform-state-bucket"
    region     = "ru-central1"
    key        = "./terraform.tfstate"
    access_key = "YCAJEIDgzcebIzp1iVV2SVefE"
    secret_key = "YCNFD1atdB3Igd5v2I6HWUyJLdW39tOC5voB8WPH"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
