FROM rust:1 as builder

COPY . .

RUN cargo build --release

FROM rust:1-slim-stretch

COPY --from=builder /target/release/ferro .

RUN ls -la /ferro

EXPOSE 3000

ENTRYPOINT ["/ferro"]
