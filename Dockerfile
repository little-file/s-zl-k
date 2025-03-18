FROM ubuntu:latest AS builder
WORKDIR /workspace

COPY . /workspace

RUN apt-get update && apt-get install -y curl gcc

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN cargo build --release

FROM debian:bookworm-slim AS runtime

COPY --from=builder /workspace/target/release/s-zl-k ./

CMD ["./s-zl-k"]
