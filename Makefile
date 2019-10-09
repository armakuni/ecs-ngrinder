.PHONY=configure-cli up

configure-cli:
	ecs-cli configure \
		--cluster ngrider-cluster-7c6fb9544489339f \
		--default-launch-type FARGATE \
		--config-name ngrinder-cluster \
		--region ap-south-1

	ecs-cli configure profile \
		--access-key $(AWS_ACCESS_KEY_ID) \
		--secret-key $(AWS_SECRET_ACCESS_KEY) \
		--profile-name ngrinder-cluster-profile

up:
	ecs-cli up --cluster-config  ngrinder-cluster --ecs-profile ngrinder-cluster-profile