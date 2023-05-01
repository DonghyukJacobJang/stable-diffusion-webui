## AWS EC2 Version

This is a fork of https://github.com/AUTOMATIC1111/stable-diffusion-webui/ based on the main version on 21 Dec 2022.

This repo contains a [setup script](https://github.com/DonghyukJacobJang/stable-diffusion-webui/blob/master/setup.sh) that can be run on an EC2 instance as a one-click deployment.

Steps:

1. Clone this repo via

```
git clone https://github.com/DonghyukJacobJang/stable-diffusion-webui
```

2. Run the CloudFormation Template via

```
aws cloudformation create-stack --stack-name sd-webui-stack --template-body file://./sd-web-ui-cf-template.yaml
```

3. Get a coffee ☕️ It will take 15-20 minutes until the app is deployed
4. Retrieve the IP address of the EC2 instance via

```
aws cloudformation list-stack-resources --stack-name sd-webui-stack --query 'StackResourceSummaries[?ResourceType==`AWS::EC2::EIP`].PhysicalResourceId' --output text
```

5. Open your web browser and navigate to <IP_ADDRESS>:7860
6. If the app is not working, connect to the EC2 instance and run `netstat -tulpn` to see if the app is running on port 7860
7. If you want to delete everything, run

```
aws cloudformation delete-stack --stack-name sd-webui-stack
```

### Todo Backlog

There are _many_ ways to improve this repo, including:

- Set up a startup script for the EC2 instance so the app start every time the instance is spun up (allows for stopping the instance when not used)
- Adding a script that allows adding more models
- Amend startup script to include upscaling models and textual inversions
- Big one: Run the inference in a SageMaker endpoint instead of the EC2 instance
