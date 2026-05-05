package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testServerlessCache(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
		Upgrade:      true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	name := terraform.Output(t, terraformOptions, "name")
	arn := terraform.Output(t, terraformOptions, "arn")
	sgIDs := terraform.Output(t, terraformOptions, "sg_ids")
	endpoint := terraform.Output(t, terraformOptions, "endpoint")
	readerEndpoint := terraform.Output(t, terraformOptions, "reader_endpoint")
	fullEngineVersion := terraform.Output(t, terraformOptions, "full_engine_version")

	accountID := getAWSAccountID(t)
	region := getAWSRegion(t)

	expectedName := fmt.Sprintf("ex-tf-serverless-%s", variant)
	expectedARNPrefix := fmt.Sprintf("arn:aws:elasticache:%s:%s:serverlesscache:%s", region, accountID, expectedName)

	assert.Equal(t, expectedName, name)
	assert.Equal(t, expectedARNPrefix, arn)
	assert.NotEmpty(t, sgIDs)
	assert.NotEmpty(t, endpoint)
	assert.NotEmpty(t, readerEndpoint)
	assert.NotEmpty(t, fullEngineVersion)
}
