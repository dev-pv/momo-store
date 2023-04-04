resource "yandex_iam_service_account" "sa" {
  name = "s3-sa"
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = "b1g6f5e97oomo9hnu6o0"
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "momo-store-bucket" {
  access_key = "YCAJEIDgzcebIzp1iVV2SVefE"
  secret_key = "YCNFD1atdB3Igd5v2I6HWUyJLdW39tOC5voB8WPH"
  bucket     = "momo-store-bucket"

    anonymous_access_flags {
    read = true
    list = false
  }
}

resource "yandex_storage_bucket" "momo-store-terraform-bucket" {
  access_key = "YCAJEIDgzcebIzp1iVV2SVefE"
  secret_key = "YCNFD1atdB3Igd5v2I6HWUyJLdW39tOC5voB8WPH"
  bucket     = "momo-store-terraform-state-bucket"

    anonymous_access_flags {
    read = false
    list = false
  }
}