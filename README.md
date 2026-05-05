# PBS TF elasticache serverless redis and memcached module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-elasticache-serverless-redis-and-memcached-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

Integrate this module like so:

```hcl
module "elasticache-serverless-redis-and-memcached" {
  source = "github.com/pbs/terraform-aws-elasticache-serverless-redis-and-memcached-module?ref=x.y.z"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
  owner        = var.owner

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.12.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.43.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_elasticache_serverless_cache.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_serverless_cache) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_default_tags.common_tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |
| [aws_subnets.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (sharedtools, dev, staging, qa, prod) | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization using this module. Used to prefix tags so that they are easily identified as being from your organization | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Tag used to group resources according to owner | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Tag used to group resources according to product | `string` | n/a | yes |
| <a name="input_repo"></a> [repo](#input\_repo) | Tag used to point to the repo using this module | `string` | n/a | yes |
| <a name="input_cache_usage_limits"></a> [cache\_usage\_limits](#input\_cache\_usage\_limits) | Sets the cache usage limits for storage and ElastiCache Processing Units for the cache. | `map(any)` | `{}` | no |
| <a name="input_create"></a> [create](#input\_create) | Determines whether serverless cache resource will be created. | `bool` | `true` | no |
| <a name="input_daily_snapshot_time"></a> [daily\_snapshot\_time](#input\_daily\_snapshot\_time) | The daily time that snapshots will be created from the new serverless cache. Only supported for engine type `redis`. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | User-created description for the serverless cache. If null, defaults to 'Serverless Cache for <name>'. | `string` | `null` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Name of the cache engine to be used for this serverless cache. Valid values are `memcached` or `redis`. | `string` | `"redis"` | no |
| <a name="input_ingress_cidr_blocks"></a> [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks) | List of CIDR blocks to allow ingress from. If null, `ingress_source_sg_id` must be used. | `list(string)` | `null` | no |
| <a name="input_ingress_source_sg_id"></a> [ingress\_source\_sg\_id](#input\_ingress\_source\_sg\_id) | Security group ID to allow ingress from. If null, `ingress_cidr_blocks` must be used. | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | ARN of the customer managed key for encrypting the data at rest. If no KMS key is provided, a default service key is used. | `string` | `null` | no |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | The version of the cache engine that will be used to create the serverless cache. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the serverless cache. If null, will default to product. | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | One or more VPC security groups associated with the serverless cache. If null, a security group will be created by this module. | `list(string)` | `null` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Name of the security group to be created. If null, will use the name of the cache. | `string` | `null` | no |
| <a name="input_snapshot_arns_to_restore"></a> [snapshot\_arns\_to\_restore](#input\_snapshot\_arns\_to\_restore) | The list of ARN(s) of the snapshot that the new serverless cache will be created from. Available for Redis only. | `list(string)` | `null` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | (Redis only) The number of snapshots that will be retained for the serverless cache that is being created. | `number` | `null` | no |
| <a name="input_subnet_data_lookup_filters"></a> [subnet\_data\_lookup\_filters](#input\_subnet\_data\_lookup\_filters) | Values of the `filter` blocks in the `aws_subnets` data source used in this module. If null, one will be guessed using the resolved VPC and a `Name` filter of `*-private-*`. Ignored if `subnet_ids` is populated. | `map(any)` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of the identifiers of the subnets where the VPC endpoint for the serverless cache will be deployed. If null, a list will be generated by looking up subnets in the resolved VPC. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Define maximum timeout for creating, updating, and deleting serverless cache resources. | `map(string)` | `{}` | no |
| <a name="input_use_prefix"></a> [use\_prefix](#input\_use\_prefix) | Whether to use prefixes in the resource names. If false, will use a fully specified name for resources. | `bool` | `true` | no |
| <a name="input_user_group_id"></a> [user\_group\_id](#input\_user\_group\_id) | The identifier of the UserGroup to be associated with the serverless cache. Available for Redis only. | `string` | `null` | no |
| <a name="input_vpc_data_lookup_tags"></a> [vpc\_data\_lookup\_tags](#input\_vpc\_data\_lookup\_tags) | Value of the `tags` parameter in the `aws_vpc` data source used in this module. If null, a dynamic lookup based on `environment` will be used. Ignored if `vpc_id` is populated. | `map(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create resources in. If null, one will be guessed based on `vpc_data_lookup_tags`. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name of the serverless cache |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Represents the information required for client programs to connect to the cache node |
| <a name="output_full_engine_version"></a> [full\_engine\_version](#output\_full\_engine\_version) | The name and version number of the engine the serverless cache is compatible with |
| <a name="output_name"></a> [name](#output\_name) | The name of the serverless cache |
| <a name="output_reader_endpoint"></a> [reader\_endpoint](#output\_reader\_endpoint) | Represents the information required for client programs to connect to the cache node (reader) |
| <a name="output_sg_ids"></a> [sg\_ids](#output\_sg\_ids) | The security group IDs associated with the serverless cache |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags applied to the serverless cache |
