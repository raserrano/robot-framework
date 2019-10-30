FROM python:3.7



RUN mkdir /home/automation
WORKDIR /home/automation
COPY . /home/automation/

RUN apt-get update > /dev/null 2>&1 && apt-get install -y wget > /dev/null 2>&1 \
	&& pip install -r requirements.txt > /dev/null 2>&1 \
	&& wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /dev/null 2>&1 \
	&& apt-get install -y fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcups2 libdbus-1-3 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxrandr2 libxtst6 lsb-release xdg-utils > /dev/null 2>&1 \
	&& dpkg -i google-chrome-stable_current_amd64.deb > /dev/null 2>&1 \
	&& google-chrome --version \
	&& ./scripts/chromedriver \
	&& chromedriver --version
RUN robot -d results -i test test_suites \
	&& ls -lha /home/automation/ > /home/automation/results/files.output \
	&& pip list > /home/automation/results/pip_list.output


ENTRYPOINT ["tail","-f","/dev/null"]