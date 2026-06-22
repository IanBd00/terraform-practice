# Terraform Practice

Repositório utilizado para estudos, testes e práticas com Terraform.

## Objetivos

- Aprender os conceitos fundamentais do Terraform
- Praticar Infraestrutura como Código (IaC)
- Criar e gerenciar recursos em nuvem
- Organizar projetos utilizando módulos
- Explorar boas práticas de desenvolvimento com Terraform

## Estrutura do Projeto

```text
project-1/
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── modules/
│   ├── compartment/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── provider.tf
│   │
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── provider.tf
│   │
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── provider.tf
│
├── TERRAFORM-COMPARTMENT/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   └── terraform.tfvars
│
├── COMPARTMENT-IMPORT-TERRAFORM/
│   ├── data.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   └── terraform.tfvars
│
├── .gitignore
└── README.md
```

### Descrição

| Diretório/Arquivo | Função |
|------------------|---------|
| `.github/workflows` | Pipeline CI/CD com GitHub Actions |
| `modules/compartment` | Criação e gerenciamento de Compartments OCI |
| `modules/network` | Provisionamento de VCN, Subnets, NSGs e recursos de rede |
| `modules/compute` | Provisionamento de instâncias Compute OCI |
| `TERRAFORM-COMPARTMENT` | Ambiente principal para criação da infraestrutura |
| `COMPARTMENT-IMPORT-TERRAFORM` | Ambiente utilizado para importar recursos existentes para o Terraform |
| `provider.tf` | Configuração do provider OCI |
| `variables.tf` | Declaração das variáveis |
| `terraform.tfvars` | Valores das variáveis do ambiente |
| `outputs.tf` | Saídas exportadas pelo Terraform |
| `data.tf` | Consulta de recursos existentes na OCI |
| `.gitignore` | Arquivos ignorados pelo Git |
| `README.md` | Documentação do projeto |



### Arquitetura

- **Módulos reutilizáveis** localizados em `modules/`
- **Ambiente principal** em `TERRAFORM-COMPARTMENT`
- **Ambiente de importação/migração** em `COMPARTMENT-IMPORT-TERRAFORM`
- **CI/CD automatizado** através do GitHub Actions
- **Backend Terraform** configurado para armazenamento remoto do estado na OCI Object Storage

