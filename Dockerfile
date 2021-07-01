FROM python:3.9.6-buster

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
RUN apt-get update && apt-get install -y xvfb wget unzip libnss3-tools
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update && apt-get install -y google-chrome-stable
RUN wget -q https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_linux64.zip -O /tmp/chromedriver_linux64.zip \
    && unzip -qq /tmp/chromedriver_linux64.zip -d /usr/local/bin \
    && rm /tmp/chromedriver_linux64.zip \
    && chmod +x /usr/local/bin/chromedriver