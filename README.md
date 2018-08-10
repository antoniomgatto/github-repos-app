# Github app

Rails app que lista os 10 repositórios com mais estrelas das linguagens Ruby, Java, Javascript, PHP, Groovy.

Utiliza:

- Rails 5.1.5
- Ruby 2.4.3

### Desenvolvimento com Docker

```bash
./build.sh
docker exec -it github-app bash
rake db:drop db:create db:migrate
rails s
```
