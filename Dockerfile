FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added modules for Node-RED
RUN npm install --only=production

RUN chown -R node-red:node-red /data

# Copy _your_ Node-RED project files into place
COPY flows.json /data/flows.json
COPY settings /data/settings.js

# Start the container normally
CMD ["npm", "start"]

