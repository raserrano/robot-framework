# Robot framework

### Requirements
For this project required version is 3

### Tools

#### Installing pyenv
Use pyenv to handle different python versions in an easy way. [Check out the official site](https://github.com/pyenv/pyenv) for more info.

##### Brief installation guide

```bash 
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
curl https://pyenv.run | bash
pyenv install --list | grep "3\."
pyenv install -v 3.7.4
python --version
pyenv versions
pyenv global 3.7.4
python --version
```

#### Installing pipenv

```bash
pip3 install pipenv
pipenv --three 
pipenv shell
pipenv graph
pipenv install selenium
pipenv install robotframework
pipenv install robotframework-seleniumlibrary
pipenv graph
```

#### Chrome driver installation
```bash
wget https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mkdir -p /opt/chromedriver
sudo mv chromedriver /opt/chromedriver/
cd /usr/local/bin/
sudo ln -s /opt/chromedriver/chromedriver
```

#### Add Pipfile.lock to .gitignore
```bash
echo "Pipfile.lock" >> .gitignore
```
#### If Pipfile exists
Assuming you are not starting from scratch just do the following
```bash 
pipenv shell
pipenv install
```
### Run
Use env variables to switch browser
`APP_URL="http://site/" BROWSER="Chrome"  python example.py`
