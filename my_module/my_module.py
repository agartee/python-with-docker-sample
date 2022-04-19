import configparser
import datetime
import os
import time



def main(logFilePath:str):
    utcnow = datetime.datetime.utcnow()
    print(f'Executed at {utcnow.strftime("%Y-%m-%dT%H:%M:%SZ")}.')
    logExecution(logFilePath, utcnow)
    

def get_root_app_dir():
    scriptDir = os.path.dirname(os.path.abspath(__file__))
    parentDir = os.path.abspath(os.path.join(scriptDir, os.pardir))
    return parentDir


def get_config(parentDir:str):
    iniPath = f'{parentDir}/app.ini'
    print(iniPath)
    config = configparser.ConfigParser()
    config.read(iniPath)
    return config


def logExecution(logFilePath:str, dateTimeStamp: datetime.datetime):
    os.makedirs(os.path.dirname(logFilePath), exist_ok=True)
    logFile = open(logFilePath, "w")
    logFile.write(dateTimeStamp.strftime("%Y-%m-%dT%H:%M:%SZ"))
    logFile.close()


if __name__ == "__main__":
    appDir = get_root_app_dir()
    config = get_config(appDir)
    delay = int(config["DEFAULT"]["DelayInSeconds"])
    lastRunLogFilePath = f'{appDir}/logs/lastrun.log'

    while True:
        main(lastRunLogFilePath)
        time.sleep(delay)
