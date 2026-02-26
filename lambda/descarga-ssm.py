import json
import boto3

ssm = boto3.client('ssm')
PARAMETER_NAME = '/lambda/api-tk'

response = ssm.get_parameter(
            Name=PARAMETER_NAME,
            WithDecryption=True
        )

print(json.loads(response['Parameter']['Value']))

