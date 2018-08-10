# Github app

Rails app que lista os 10 repositórios com mais estrelas das linguagens Ruby, Java, Javascript, PHP, Groovy.

Utiliza:

- Rails 5.1.5
- Ruby 2.4.3

### Desenvolvimento com Docker

Criar arquivo .env na raiz do projeto com os seguintes valores:

```
RACK_ENV=development
PORT=3000
```

Executar na raiz do projeto:

```bash
./build.sh
docker exec -it github-app bash
rake db:drop db:create db:migrate
foreman start
```

### Testes

Com o ambiente Docker rodando, execute:
```bash
docker exec -it github-app rspec
```