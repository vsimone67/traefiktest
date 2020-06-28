kubectl create secret generic appsettings-secret-traefiktest --namespace playground --from-file=../appsettings.secrets.json

kubectl create configmap appsettings-traefiktest --namespace playground --from-file=../appsettings.json