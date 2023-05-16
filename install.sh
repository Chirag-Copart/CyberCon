pip3 install -r requirements.txt
chmod +x CyberCon.sh

#To Install pip3 in Kali Linux:
curl "https://bootstrap.pypa.io/get-pip.py" -o "install-pip3-ubuntu.py"
python3 install-pip3-ubuntu.py
pip3 --version

#Install Go Lang
apt install golang-go -y

#Tools


#dirsearch
git clone https://github.com/maurosoria/dirsearch.git --depth 1

#LinkFinder
git clone https://github.com/GerbenJavado/LinkFinder.git && cd LinkFinder && python setup.py && pip3 install -r requirements.txt && cd ..

#NUclei
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest && nuclei update-templates

#CRLFUZZ
go install -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
chmod +x go/bin/crlfuzz
cp /go/bin/crlfuzz /usr/bin

#CMS-Map
git clone https://github.com/Dionach/CMSmap
cd CMSmap
python setup.py install
cd

#GAU
#go install github.com/lc/gau/v2/cmd/gau@latest

#GF
#go install -a github.com/tomnomnom/gf@latest

#GF-Pattern
#git clone https://github.com/1ndianl33t/Gf-Patterns

#ParamSPider
#git clone https://github.com/devanshbatham/ParamSpider && cd ParamSpider && pip3 install -r requirements.txt && python3 paramspider.py -h && cd ..

#WaybackURL
#go install -a github.com/tomnomnom/waybackurls@latest

#Bypass-403
#git clone https://github.com/iamj0ker/bypass-403 && cd bypass-403 && chmod +x bypass-403.sh && sudo apt install figlet && cd ..

#Aquatone
#echo "Installing Aquatone-discover"
#gem install aquatone

#Amass
#echo "Installing Amass"

