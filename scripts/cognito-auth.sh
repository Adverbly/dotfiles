curl -X POST --data "@$HOME/.aws-auth-data.json" \
-H 'X-Amz-Target: AWSCognitoIdentityProviderService.InitiateAuth' \
-H 'Content-Type: application/x-amz-json-1.1' \
https://cognito-idp.us-east-1.amazonaws.com/ | jq '.AuthenticationResult.AccessToken'

# example json: 
# {
#   "AuthParameters" : {
#      "USERNAME" : "me@yep.com",
#      "PASSWORD" : "foo"
#   },
#   "AuthFlow" : "USER_PASSWORD_AUTH",
#   "ClientId" : "asdfasdfasdfasdf"
#}
