### BUILD STEP ###
FROM node:12-alpine as build
ARG DOMAIN
WORKDIR /app

COPY ./app/package.json .
COPY ./app/package-lock.json .

RUN node --max-old-space-size=4096 `which npm` install

COPY ./app/public/ ./public/
COPY ./app/src/ ./src/

RUN REACT_APP_DOMAIN=${DOMAIN} \
    REACT_APP_FIREBASE_API_KEY="AIzaSyDZKQxESgGTqiqlUJFG4FNB_bYPnv-mDT0" \
    REACT_APP_FIREBASE_AUTH_DOMAIN="k8s-exercise-78642.firebaseapp.com" \
    REACT_APP_FIREBASE_PROJECT_ID="k8s-exercise-78642" \
    REACT_APP_FIREBASE_STORAGE_BUCKET="k8s-exercise-78642.appspot.com" \
    REACT_APP_FIREBASE_SENDER_ID="916592427812" \
    REACT_APP_FIREBASE_APP_ID="1:916592427812:web:3ec400194a5e6e689ba9b1" \
    npm run build

### IMAGE ASSEMBLY ###
FROM nginx:1-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
