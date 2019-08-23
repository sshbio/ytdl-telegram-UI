**Youtube-dl Telegram UI** 

This private bot  download the youtube videos on your server and keep them for 48 hours(default). every authorized user should have a telegram account with username. all the files are downloaded to the **dl** folder and will be remove after 48 hours.
docker compose file example:
**Requirements :**
1- At least one telegram account with username
2- A  docker enabled server or Nodejs installed

**Docker compose file**
You can use config file or environment variables(ENV has priority) to config the app, first create a Bot using Telegram botFather and enabled inline_keyboard feature.
**Config the environments:** 
USERNAMES=comma separated users' telegram username 
BOT_TOKEN=from the BotFather 
BASE_URL= http://yourserver.com
PORT=80 the server http listen port
ex. result http://yourserver.com/5af67e98afeabd363c6278053cc1e4bf.mp4 

```yml
version: '2'
services:
  backend:
    image: pakoo/ytdl:latest
    environment:
      - USERNAMES=user1,user2
      - BOT_TOKEN=xxxxxxxxxxxxxxxxxxxxx
      - BASE_URL=https://yourserver.com
      - PORT=80
    restart: always
    networks:
      - network
    volumes:
      - files_data:/app/dl

networks:
  network:

volumes:
  files_data:
    external: false
    driver: local 
```