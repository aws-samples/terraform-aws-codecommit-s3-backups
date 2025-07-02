## aws-terraform-codeCommit-s3-backups

Backup AWS CodeCommit repositories to Amazon S3. 

(or risk discovering that [deleting an AWS CodeCommit repository is a one-way operation](https://aws.amazon.com/codecommit/faqs/))

## Module Inputs

```hcl
module "codecommit-s3-backups" {
  source  = "aws-samples/codecommit-s3-backups/aws"
  version = "2.2.x"
  name    = "codecommit-s3-backup" 
}
```
The `name` is used in the resource names (AWS CodeBuild project, IAM Roles, etc). 

### Optional Inputs

```hcl
module "codecommit_s3_backup" {
  ...
  kms_key               = aws_kms_key.this.arn
  access_logging_bucket = aws_s3_bucket.this.id
 }
```

`kms_key` is the arn of an existing AWS KMS key. It encrypts the Amazon S3 bucket and Amazon CloudWatch Log group. The AWS KMS key policy will need to follow [CloudWatch Logs guidance for AWS KMS](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html) and [CodeBuild guidance for AWS KMS](https://docs.aws.amazon.com/codebuild/latest/userguide/setting-up-kms.html). 

`access_logging_bucket` is the arn of an Amazon S3 access logging bucket. 


## Architecture
<div align="center">
<img alt="architecture" width="600" src="./img/architecture.png" />
</div>
A
1. Users push code to a repository in CodeCommit.
2. Amazon EventBridge monitors for changes to any repository.
3. EventBridge invokes AWS CodeBuild and sends it information about the repository. 
4. CodeBuild clones the repository and packages it into a .zip file.
5. CodeBuild uploads the .zip file to an S3 bucket. 

## Related Resources

- [Automate event-driven backups from CodeCommit to Amazon S3 using CodeBuild and CloudWatch Events](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/automate-event-driven-backups-from-codecommit-to-amazon-s3-using-codebuild-and-cloudwatch-events.html)
- [Terraform Registry: aws-samples/codecommit-s3-backups/aws](https://registry.terraform.io/modules/aws-samples/codecommit-s3-backups/aws/latest)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
