terraform {
  cloud {
    organization = "LeChatErrant"

    workspaces {
      name = "ops-template"
    }
  }
}
