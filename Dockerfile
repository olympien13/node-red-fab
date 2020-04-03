FROM nodered/node-red

RUN chown -R node-red:node-red /data
RUN chmod 778 /data


# Copy package.json to the WORKDIR so npm builds all
# of your added modules for Node-RED
RUN npm install --only=production


# Copy _your_ Node-RED project files into place
COPY flows.json /data/flows.json
COPY settings.js /data/settings.js

# Start the container normally
CMD ["npm", "start"]

