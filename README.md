# **Robotframework + Docker Workshop**

## Description
Welcome to the basic automation workshop with robotframework as an automation tool and docker for tests excution
environment


## **Topics**
- Robotframework (What is it and basic setup)
- Project setup (First test case execution)
- Docker (What is it and basic setup)
- Test execution with selenoid

### Robotframework
Robot Framework is a generic open source automation framework for acceptance testing, acceptance test driven
development (ATDD), and robotic process automation (RPA). It has easy-to-use tabular test data syntax and it
utilizes the keyword-driven testing approach. Its testing capabilities can be extended by test libraries
implemented either with Python or Java, and users can create new higher-level keywords from existing ones using
the same syntax that is used for creating test cases

### Docker
Package Software into Standardized Units for Development, Shipment and 
Deployment

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
`APP_URL="http://34.205.174.166/" BROWSER="Chrome"  python example.py`

Using robot framework run
`robot -d results -i test test_suites`

pipenv install PyYAML
pipenv install robotframework-pabot
pipenv install robotframework-stringformat