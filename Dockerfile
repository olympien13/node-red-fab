FROM nodered/node-red

USER root

RUN adduser -D fab 
RUN chown -R fab:fab /data
RUN chmod 777 /data

USER node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added modules for Node-RED
RUN npm install --only=production


# Copy _your_ Node-RED project files into place
COPY flows.json /data/flows.json
COPY settings.js /data/settings.js

USER fab

# Start the container normally
CMD ["npm", "start"]

