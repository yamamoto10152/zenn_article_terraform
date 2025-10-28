# resource "snowflake_api_integration" "aws" {
#   name                 = "aws_integration"
#   api_provider         = "aws_api_gateway"
#   api_aws_role_arn     = "arn:aws:iam::000000000001:/role/test"
#   api_allowed_prefixes = ["https://123456.execute-api.us-west-2.amazonaws.com/prod/"]
#   enabled              = true
# }

# resource "snowflake_api_integration" "azure" {
#   name                    = "azure_integration"
#   api_provider            = "azure_api_management"
#   azure_tenant_id         = "00000000-0000-0000-0000-000000000000"
#   azure_ad_application_id = "11111111-1111-1111-1111-111111111111"
#   api_allowed_prefixes    = ["https://apim-hello-world.azure-api.net/"]
#   enabled                 = true
# }

# resource "snowflake_api_integration" "github_integration" {
#   name                 = "github_integration"
#   api_provider         = "git_https_api"
#   api_allowed_prefixes = ["https://github.com/"]
#   enabled              = true
# }