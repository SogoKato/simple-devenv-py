FROM python

WORKDIR /workspace

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt update && \
    apt install curl git

# Comment out if you don't use VS Code Server
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | sh

USER $USERNAME

RUN curl -sSL https://install.python-poetry.org | python3 -

# You may uncomment after files below are created
# COPY pyproject.toml poetry.lock ./
# RUN poetry install

ENV SHELL /bin/bash
ENV PATH=$PATH:/home/$USERNAME/.local/bin

# Comment out if you don't use VS Code Server
CMD ["code-server", "serve", "--accept-server-license-terms", "--random-name", "--server-data-dir", "/workspace/.vscode-server"]

# Uncomment if you don't use VS Code Server
# CMD ["/bin/sh", "-c", "while sleep 1000; do :; done"]
