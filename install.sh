#!/bin/bash

mkdir -p ~/.tools

# Install Python Tools
git clone https://github.com/blechschmidt/massdns.git 
mv massdns ~/.tools
cd ~/.tools/massdns
make
make install

pip3 install -U pip setuptools
git clone https://github.com/cramppet/regulator
mv regulator ~/.tools
pip3 install -r ~/.tools/regulator/requirements.txt

pip3 install uro

# Install Go
wget https://go.dev/dl/go1.19.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
echo 'export PATH=$PATH:~/go/bin' >> $HOME/.bashrc
source $HOME/.bashrc

# Install Go Tools
/usr/local/go/bin/go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
/usr/local/go/bin/go install -v github.com/OWASP/Amass/v3/...@master
/usr/local/go/bin/go install github.com/d3mondev/puredns/v2@latest
/usr/local/go/bin/go install github.com/projectdiscovery/katana/cmd/katana@latest
/usr/local/go/bin/go install github.com/lc/gau/v2/cmd/gau@latest
/usr/local/go/bin/go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
/usr/local/go/bin/go install -v github.com/tomnomnom/anew@latest
/usr/local/go/bin/go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
/usr/local/go/bin/go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
/usr/local/go/bin/go install github.com/tomnomnom/meg@latest
/usr/local/go/bin/go install -v github.com/musana/fuzzuli@latest
/usr/local/go/bin/go install github.com/JoshMorrison99/goparms@latest


# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH=$PATH:~/.cargo/bin
echo 'export PATH=$PATH:~/.cargo/bin' >> $HOME/.bashrc
source $HOME/.bashrc

# Install Rust Tools
~/.cargo/bin/cargo install ripgen

wget https://github.com/Sh1Yo/x8/releases/download/v4.1.0/x86_64-opensslv1-linux-x8.gz
gzip -d x86_64-opensslv1-linux-x8.gz
mv x86_64-opensslv1-linux-x8 x8
chmod +x x8
cp x8 /usr/bin/

git clone https://github.com/findomain/findomain.git
cd findomain
cargo build --release 
cp target/release/findomain /usr/bin/

# Install Wordlists
wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt
mv best-dns-wordlist.txt ~
wget https://raw.githubusercontent.com/JoshMorrison99/shmacked.txt/main/onelistforallshort.txt
mv onelistforallshort.txt ~
wget https://raw.githubusercontent.com/six2dez/resolvers_reconftw/main/resolvers.txt
mv resolvers.txt ~
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/burp-parameter-names.txt
mv burp-parameter-names.txt ~

# Install Latest Nuclei Templates
git clone https://github.com/projectdiscovery/nuclei-templates
mv nuclei-templates ~
git clone https://github.com/projectdiscovery/fuzzing-templates
mv fuzzing-templates ~
