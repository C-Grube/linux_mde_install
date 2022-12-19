sudo apt install curl
wait
sudo apt install libplist-utils
wait
https://packages.microsoft.com/config/ubuntu/22.04/prod.list
wait
curl -k -o microsoft.list https://packages.microsoft.com/config/ubuntu/22.04/prod.list
wait
sudo mv ./microsoft.list /etc/apt/sources.list.d/microsoft-prod.list
wait
sed -i 's/https/http/g' /etc/apt/sources.list.d/microsoft-prod.list
wait
sudo apt install gpg
wait
curl -k -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
wait
sudo apt install apt-transport-https
wait
sudo apt update
wait
sudo apt install mdatp -y
wait
sudo python3 $1