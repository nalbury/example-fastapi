FROM python:3.12-bullseye as base

ARG WORKDIR=/src/
WORKDIR $WORKDIR

ADD requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

FROM base as devcontainer

ARG USERNAME=devcontainer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

ADD ./ ./

FROM base as run

ADD ./app ./app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5050"]
