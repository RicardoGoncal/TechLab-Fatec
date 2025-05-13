# Usa a imagem mínima do Ubuntu Server 22.04 LTS
FROM ubuntu:jammy

# Configuração para evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependências básicas (sem bloat)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git \
    unzip \
    gnupg \
    software-properties-common \
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# Google Cloud CLI (apenas componentes essenciais)
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && apt-get update && apt-get install -y --no-install-recommends google-cloud-cli \
    && rm -rf /var/lib/apt/lists/* \
    && gcloud config set core/disable_usage_reporting true

# Terraform (versão mais recente)
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install -y --no-install-recommends terraform \
    && rm -rf /var/lib/apt/lists/*

# kubectl, kubectx e kubens (sem instalar via apt para evitar dependências desnecessárias)
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl && mv kubectl /usr/local/bin/ \
    && git clone --depth=1 https://github.com/ahmetb/kubectx /opt/kubectx \
    && ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx \
    && ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# Helm (instalação direta via script)
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Limpeza final
RUN apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /workspace
CMD ["/bin/bash"]