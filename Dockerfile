FROM node:6-onbuild as builder

FROM nginx:mainline-alpine
COPY --from=builder /usr/src/app/*.html /usr/share/nginx/html/
COPY --from=builder /usr/src/app/img /usr/share/nginx/html/img
COPY --from=builder /usr/src/app/css /usr/share/nginx/html/css
COPY --from=builder /usr/src/app/lib /usr/share/nginx/html/lib
COPY --from=builder /usr/src/app/js /usr/share/nginx/html/js
COPY --from=builder /usr/src/app/plugin /usr/share/nginx/html/plugin

