echo "Generating ./cloud.json"
echo "cloud: ${CLOUD_PROVIDER}"
echo "zone: ${ZONE}"
cat > /app/provider/cloud.json <<EOF
{
    "cloudName": "${CLOUD_PROVIDER}",
    "zone": "${ZONE}"
}
EOF
cat ./provider/cloud.json
echo "Launching NGINX!"
/opt/bitnami/scripts/nginx/run.sh