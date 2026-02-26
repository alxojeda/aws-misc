FROM public.ecr.aws/lambda/python:3.11

RUN pip install google-auth google-auth-oauthlib google-api-python-client boto3

COPY credentials.json token.json ${LAMBDA_TASK_ROOT}
COPY index.py ${LAMBDA_TASK_ROOT}

CMD ["index.envio"]
