cd ./scripts/

wget -q "https://gdc.cancer.gov/system/files/authenticated%20user/0/gdc-client_v1.4.0_OSX_x64_10.12.6.zip"

unzip -q gdc-client_v1.4.0_OSX_x64_10.12.6.zip

run_gdc=$(echo $PWD"/gdc-client")

echo "to run gdc-client please use the following command: \$run_gdc"

echo "the output from \$gdc-client --help should look like:" 
$run_gdc --help
