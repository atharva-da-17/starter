variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "resource_group_name" {
  description = "Existing resource group containing the Data Factory"
  type        = string
}

variable "data_factory_name" {
  description = "Existing Data Factory name"
  type        = string
}

# Lookup the existing Data Factory instance

data "azurerm_data_factory" "adf" {
  name                = var.data_factory_name
  resource_group_name = var.resource_group_name
}

# Deploy ADF pipeline definition from JSON file
resource "azurerm_data_factory_pipeline" "pipeline" {
  name            = "sample-pipeline-${var.environment}"
  data_factory_id = data.azurerm_data_factory.adf.id

  # The pipeline JSON should be authored in dev and exported to this repo
  pipeline_json = file("${path.module}/pipeline.json")
}
