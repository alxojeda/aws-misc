import boto3
from pathlib import Path

# Configuración
REGION = "us-east-1"
PARAM_NAME = "/lambda/api-tk"
TOKEN_FILE = "token.json"

# Leer el archivo
value = Path(TOKEN_FILE).read_text()

# Cliente SSM
ssm = boto3.client("ssm", region_name=REGION)

# Crear / actualizar parámetro
response = ssm.put_parameter(
    Name=PARAM_NAME,
    Value=value,
    Type="SecureString",
    Overwrite=True
)

print("Parameter stored successfully")
print("Version:", response["Version"])

