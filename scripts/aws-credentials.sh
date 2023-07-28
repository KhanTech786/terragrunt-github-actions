export ASSUME_ROLE_ARN=${ASSUME_ROLE_ARN:-arn:aws:iam::407434084714:role/AssumeRoleDevOpsAdmin}

if [ "$AWS_SERIAL_NUMBER" == "" ]; then
    echo AWS_SERIAL_NUMBER is not set
    echo -n AWS_SERIAL_NUMBER:
    read AWS_SERIAL_NUMBER
    export AWS_SERIAL_NUMBER
fi

if [ "$AWS_DEFAULT_PROFILE" == "" ]; then
    echo AWS_DEFAULT_PROFILE is not set
    echo -n AWS_DEFAULT_PROFILE:
    read AWS_DEFAULT_PROFILE
    export AWS_DEFAULT_PROFILE
fi

# ensure the AWS_PROFILE environment variable is not also set 
unset AWS_PROFILE




function sts_get_session_token(){
    unset AWS_SESSION_TOKEN AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
    aws sts get-session-token \


function sts_assume_role(){
    aws sts assume-role \
    --role-arn ${1} \
]; then
--serial-number $1 \
--token-code ${2} |
ja -r .Credentials| "AWS_SESSION_TOKEN="+.SessionToken+" AWS_ACCESS_KEY_ID="+.AccessKeyId+" AWS_SECRET_ACCESS
Raja, Rap
--role-session-name "${USER}" I
ja -r.Credentials| "AWS_SESSION_TOKEN="+.SessionToken+" AWS_ACCESS_KEY_ID="+.AccessKeyId+" AWS_SECRET_ACCESS_
function validate_credentials (){
•
echo account_alias: $(aws iam list-account-aliases|jq -r .AccountAliases[0]')
aws sts get-caller-identityljq -r "account: "+ .Account +"\nsession-arn:
+ .Arn'

22
23
24
25
26
27
28
29
30 function sts_assume_role(){
31
aws sts assume-role \
32
--role-arn ${1} \\
33
34
35
36
37
38
39
40
41
42
43
44
45
46
}
unset AWS_SESSION_TOKEN AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
aws sts get-session-token \
aws-credentials.sh-akhan0327 [SSH: $5290calv.ews.int] - Visual Studio Code
aws-credentials.sh X
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
source.sh
--serial-number $1 \
--token-code ${2} |
ja -r.Credentials| "AWS_SESSION_TOKEN="+.SessionToken+" AWS_ACCESS_KEY_ID="+.AccessKeyId+" AWS_SECRET_ACCESS_KEY="+.SecretAccesskey
--role-session-name "${USER}" |
ja -r .Credentials| "AWS_SESSION_TOKEN="+.SessionToken+" AWS_ACCESS_KEY_ID="+.AccessKeyId+" AWS_SECRET_ACCESS_KEY="+.SecretAccesskey
}
function validate_credentials(){
echo account_alias: $(aws iam list-account-aliases|jq -r .AccountAliases [0]')
aws sts get-caller-identity|jq -r ""account: "+ .Account +"\nsession-arn:
"1 + .Arn'
}
function get temporary_credentials(){
echo mfa serial: $AWS_SERIAL_NUMBER
echo role_arn: $ASSUME_ROLE_ARN
echo -n mfa token:
read-5 TOKEN_CODE
echo
echo "==> getting session token with mfa credentials"
export $(sts_get_session_token $AWS_SERIAL_NUMBER $TOKEN_CODE) echo "done"
echo "==> assuming role $ASSUME_ROLE_ARN"
export $(sts_assume_role $ASSUME_ROLE_ARN) echo "done"
eval $@
plan1.txt
echo "==> validating credentials"
validate_credentials
echo "done"
linux_instance_svc_dp.tf
PROBLEMS 21 OUTPUT DEBUG

