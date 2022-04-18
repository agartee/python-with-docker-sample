import configparser
from datetime import date, datetime
import time



def main():
    utcnow = datetime.datetime.utcnow()
    print(f'Executed at {utcnow}.')
    logExecution(utcnow)


def logExecution(utcnow: date):
    config = configparser.ConfigParser()
    config.read('../app.ini')
    lastRunFilePath = config['LOGGING']['LastRun']
    logFile = open(lastRunFilePath, "w")
    logFile.write(str(utcnow))


if __name__ == "__main__":
    while True:
        main()
        time.sleep(5)
