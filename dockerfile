FROM portainer/portainer-ce:2.11.1 as pre-build-stage

COPY ./main.css /public/main.css
COPY ./concat.sh /public/concat.sh

# build-stage

FROM alpine:3.14.1 as build-stage

RUN mkdir /public

COPY --from=pre-build-stage /public /public

RUN /public/concat.sh

RUN rm -rf /public/main.css
RUN rm -rf /public/concat.sh

# production-stage

FROM portainer/portainer-ce:2.11.1 as production-stage

COPY --from=build-stage /public /public
