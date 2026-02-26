import base64
from email.message import EmailMessage
import os
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
import boto3
import json

SCOPES = ["https://mail.google.com/"]
PARAMETER_NAME = '/lambda/api-tk'

def envio(event, context):
    print("================================Ejecutandose ================================")
    
    asunto = "Prueba"

    ssm = boto3.client('ssm')
    creds = None
    response = ssm.get_parameter(Name=PARAMETER_NAME,WithDecryption=True)
    tokenjson = json.loads(response['Parameter']['Value'])
    creds = Credentials.from_authorized_user_info(tokenjson, SCOPES)

    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file('credentials.json', SCOPES)
            creds = flow.run_local_server(port=0)

        ssm.put_parameter(Name=PARAMETER_NAME,Value=creds.to_json(),Type='SecureString',Overwrite=True)

    try:
        service = build('gmail', 'v1', credentials=creds)
        message = EmailMessage()

        message.set_content("")
        message["To"] = "alxojeda.dev@gmail.com" # Reemplaza con el destinatario
        message["From"] = "alxojeda.dev@gmail.com" # Reemplaza con tu cuenta de Gmail
        message["Subject"] = asunto

        encoded_message = base64.urlsafe_b64encode(message.as_bytes()).decode()
        create_message = {'raw': encoded_message}
        send_message = (service.users().messages().send(userId="me", body=create_message).execute())
        print(f'Mensaje enviado. ID del mensaje: {send_message["id"]}')
        return send_message
    except HttpError as error:
        print(f'Ocurrió un error: {error}')
        return None
