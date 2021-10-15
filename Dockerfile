FROM node:12.16.3


LABEL key="Akintola Stephen"  

# Install dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000

# Command to run the app
CMD [ "npm", "start" ]
