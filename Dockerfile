FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added modules for Node-RED
RUN npm install --only=production

# Copy _your_ Node-RED project files into place
COPY flows.json /data/flows.json

# Start the container normally
CMD ["npm", "start"]

