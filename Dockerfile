FROM cypress/included:9.0.0

WORKDIR /e2e

COPY ./cypress ./cypress
COPY ./package.json ./package.json
COPY ./cypress.json ./cypress.json

RUN npx cypress verify
RUN npm install

