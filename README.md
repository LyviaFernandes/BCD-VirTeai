# 🗄️ Banco de Dados - VirTEAI

Este repositório contém o script de criação e configuração do banco de dados **`dblogin`**, utilizado no backend do projeto **VirTEAI**. Esse banco gerencia a estrutura de permissões de acesso dos usuários à plataforma.

---

## 🎯 Finalidade

O banco `dblogin` tem como objetivo principal armazenar os **níveis de privilégio** dos usuários da aplicação, possibilitando controle de acesso (ex: Admin x Usuário comum).

Este módulo pode ser estendido posteriormente para integrar com tabelas de usuários, produtos, pedidos e interações com realidade virtual.

---

## 🧱 Estrutura do Banco

### 📌 Nome do banco: `dblogin`

### 📄 Tabela: `privilege`

| Coluna           | Tipo                 | Restrições                        | Descrição                              |
|------------------|----------------------|-----------------------------------|----------------------------------------|
| `id`             | INT UNSIGNED         | PRIMARY KEY, AUTO_INCREMENT       | Identificador único do privilégio      |
| `name`           | VARCHAR(20)          | NOT NULL                          | Nome do privilégio (ex: ADMIN, USER)   |
| `description`    | TEXT                 | —                                 | Descrição do privilégio                |
| `privilege_level`| INT                  | NOT NULL, UNIQUE                  | Nível numérico do privilégio           |

---

## 📥 Script de Criação

```sql
CREATE DATABASE IF NOT EXISTS dblogin;

USE dblogin;

CREATE TABLE privilege (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    description TEXT,
    privilege_level INT NOT NULL UNIQUE
);

INSERT INTO privilege (name, description, privilege_level)
VALUES
    ('ADMIN', 'Administrador do sistema', 1),
    ('USER', 'Usuário padrão do sistema', 2);
````
🛠️ Como usar
1. Acesse seu MySQL:
```bash
mysql -u root -p
2. Execute o script:
Você pode colar o conteúdo ou salvar em um arquivo .sql e rodar com:
````
```bash
source caminho/para/script.sql;
🔐 Níveis de Acesso
ADMIN (1): acesso total à aplicação, incluindo gerenciamento de usuários, produtos e relatórios.

USER (2): acesso padrão, com permissões para navegar, comprar e visualizar pedidos.
```
🔄 Integração com o Backend
A tabela privilege será usada na autenticação do Spring Boot (via User + Privilege) para:

Associar cada usuário a um nível de acesso

Aplicar filtros de permissões nas rotas (ex: /admin/**)

Controlar funcionalidades visíveis no front-end

📌 Próximas Etapas
Criação da tabela user, com chave estrangeira para privilege.id

Integração com Spring Security (backend)

Seed automatizado com dados iniciais

📬 Contribuição
Se você deseja sugerir melhorias no modelo ou expandi-lo, sinta-se livre para abrir uma issue ou pull request.

