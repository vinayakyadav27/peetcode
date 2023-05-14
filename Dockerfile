FROM node:18-alpine as builder
WORKDIR /peetcode

COPY . /peetcode
RUN cd server && npm install && cd .. && cd client && npm install && npm run build 

FROM nginx
EXPOSE 80
COPY --from=builder /peetcode/client/dist /usr/share/nginx/html



# CMD cd client && npm run dev -- --host

