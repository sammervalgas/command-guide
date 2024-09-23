# Bash Aliases 

## GIT
```bash

# Atalhos Git simples para o arquivo .bash_aliases

# Inicializar repositório
alias gi='git init'

# Clonar repositório
alias gcl='git clone'

# Status do repositório
alias gs='git status'

# Adicionar todos os arquivos
alias ga='git add .'

# Fazer commit com mensagem
alias gc='git commit -m'

# Fazer commit com mensagem e pular editor
alias gcm='git commit -m'

# Fazer commit interativo
alias gci='git commit -v'

# Ver log simplificado
alias gl='git log --oneline --graph --decorate'

# Ver log detalhado
alias gld='git log --stat'

# Ver diffs
alias gd='git diff'

# Ver diffs entre commits
alias gdc='git diff commit1 commit2'

# Fazer pull
alias gpl='git pull'

# Fazer push
alias gps='git push'

# Criar nova branch
alias gnb='git checkout -b'

# Trocar de branch
alias gco='git checkout'

# Mesclar branch
alias gmg='git merge'

# Excluir branch local
alias gbd='git branch -d'

# Forçar exclusão de branch
alias gbdf='git branch -D'

# Exibir branches
alias gbr='git branch'

# Exibir branches remotas
alias gbrm='git branch -r'

# Verificar as remotas
alias grm='git remote -v'

# Adicionar repositório remoto
alias gra='git remote add origin'

# Renomear repositório remoto
alias grn='git remote rename old_name new_name'

# Resetar modificações não commitadas
alias grs='git reset --hard'

# Exibir arquivos modificados
alias gst='git stash'

# Armazenar mudanças
alias gsp='git stash push'

# Restaurar stash
alias gstp='git stash pop'

# Aplicar stash específico
alias gsta='git stash apply stash@{n}'

# Listar stashes
alias gsts='git stash list'

# Reverter último commit (mantendo alterações)
alias grc='git reset --soft HEAD~1'

# Reverter um commit específico
alias grv='git revert'

# Verificar o estado de um arquivo específico
alias gsa='git status --short'

# Verificar diferenças entre o diretório de trabalho e o último commit
alias gds='git diff --cached'

# Criar nova tag
alias gtag='git tag'

# Listar tags
alias gtags='git tag -l'

# Enviar tags para o repositório remoto
alias gpt='git push origin --tags'

# Exibir os aliases git configurados
alias galias='git config --get-regexp alias'
```

## Angular
```bash
# Atalhos Angular para o arquivo .bash_aliases

# Criar novo projeto Angular
alias ngnew='ng new'

# Servir o aplicativo Angular em modo de desenvolvimento
alias ngserve='ng serve'

# Criar um novo componente
alias ngc='ng generate component'

# Criar um novo serviço
alias ngs='ng generate service'

# Criar um novo módulo
alias ngm='ng generate module'

# Criar uma nova diretiva
alias ngd='ng generate directive'

# Criar uma nova página (rota)
alias ngr='ng generate route'

# Criar um novo pipe
alias ngp='ng generate pipe'

# Construir o aplicativo para produção
alias ngbuild='ng build --prod'

# Executar testes
alias ngtest='ng test'

# Executar testes de ponta a ponta
alias nge2e='ng e2e'

# Atualizar Angular CLI
alias ngupdate='ng update'

# Listar dependências do projeto
alias ngdep='ng dependency-graph'

# Ver a versão do Angular CLI
alias ngversion='ng version'

# Exibir help do Angular CLI
alias ngh='ng help'

```

## NPM
```bash
# Atalhos npm para o arquivo .bash_aliases

# Instalar um pacote
alias ni='npm install'

# Instalar um pacote globalmente
alias nig='npm install -g'

# Instalar dependências do package.json
alias ninstall='npm install'

# Remover um pacote
alias nr='npm uninstall'

# Remover um pacote globalmente
alias nrg='npm uninstall -g'

# Atualizar um pacote
alias nu='npm update'

# Executar script definido no package.json
alias ns='npm run'

# Exibir informações sobre o pacote
alias niinfo='npm info'

# Listar pacotes instalados
alias nl='npm list'

# Listar pacotes globais instalados
alias nlg='npm list -g --depth=0'

# Limpar o cache do npm
alias nc='npm cache clean --force'

# Ver a versão do npm instalada
alias nv='npm -v'

# Verificar se há pacotes desatualizados
alias noutdated='npm outdated'

# Criar um novo projeto com package.json
alias ninit='npm init -y'

# Instalar todas as dependências do package.json (incluindo devDependencies)
alias ninstallall='npm install --include=dev'

# Rodar o servidor de desenvolvimento
alias nserve='npm start'

# Executar testes
alias ntest='npm test'
```

## Docker

```bash
# Atalhos Docker para o arquivo .bash_aliases

# Listar contêineres em execução
alias dps='docker ps'

# Listar todos os contêineres
alias dpsa='docker ps -a'

# Iniciar um contêiner
alias dstart='docker start'

# Parar um contêiner
alias dstop='docker stop'

# Remover um contêiner
alias drm='docker rm'

# Remover todos os contêineres parados
alias drma='docker container prune'

# Criar e iniciar um contêiner
alias drun='docker run -it'

# Construir uma imagem Docker
alias dbuild='docker build -t'

# Executar um comando em um contêiner em execução
alias dexec='docker exec -it'

# Mostrar logs de um contêiner
alias dlogs='docker logs'

# Remover uma imagem Docker
alias rmi='docker rmi'

# Listar imagens Docker
alias dimages='docker images'

# Limpar imagens não utilizadas
alias dclean='docker image prune'

# Ver o uso de disco
alias ddf='docker system df'

# Remover volumes não utilizados
alias dvclean='docker volume prune'

# Parar e remover todos os contêineres
alias drmc='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'

# Remover todas as imagens não utilizadas
alias drmi='docker rmi $(docker images -f "dangling=true" -q)'

# Acessar um contêiner em execução
alias dattach='docker attach'

# Inspecionar um contêiner
alias di='docker inspect'

# Listar redes Docker
alias dnet='docker network ls'

# Criar uma nova rede Docker
alias dnetcreate='docker network create'

# Conectar um contêiner a uma rede
alias dnetconnect='docker network connect'

# Desconectar um contêiner de uma rede
alias dnetdisconnect='docker network disconnect'
```

## Flutter

```bash
# Atalhos Flutter simplificados para o arquivo .bash_aliases

# Criar novo projeto
alias fc='flutter create'

# Executar aplicativo
alias fr='flutter run'

# Parar execução
alias fs='flutter stop'

# Compilar para produção
alias fb='flutter build'

# Ver status
alias fd='flutter doctor'

# Listar dispositivos
alias fdv='flutter devices'

# Instalar dependências
alias fpg='flutter pub get'

# Atualizar dependências
alias fpu='flutter pub upgrade'

# Executar testes
alias ft='flutter test'

# Analisar código
alias fa='flutter analyze'

# Ver versão do Flutter
alias fv='flutter --version'

# Limpar build
alias fclean='flutter clean'
```

## DotNet Core
```bash
# Atalhos .NET Core simplificados para o arquivo .bash_aliases

# Criar um novo projeto
alias dnnew='dotnet new'

# Executar o aplicativo
alias dnrun='dotnet run'

# Compilar o aplicativo
alias dnbuild='dotnet build'

# Restaurar dependências
alias dnrestore='dotnet restore'

# Executar testes
alias dntest='dotnet test'

# Publicar o aplicativo
alias dnpublish='dotnet publish'

# Adicionar um novo pacote
alias dnadd='dotnet add package'

# Remover um pacote
alias dnremove='dotnet remove package'

# Listar pacotes instalados
alias dnlist='dotnet list package'

# Ver informações do projeto
alias dninfo='dotnet info'

# Limpar arquivos de build
alias dnclean='dotnet clean'

```

## Maven
```bash
# Atalhos Maven para o arquivo .bash_aliases

# Compilar o projeto
alias mvncompile='mvn compile'

# Executar testes
alias mvntest='mvn test'

# Executar o aplicativo
alias mvnrun='mvn spring-boot:run'

# Limpar o diretório de build
alias mvnclean='mvn clean'

# Instalar o pacote no repositório local
alias mvnin='mvn install'

# Atualizar dependências
alias mvnupdate='mvn versions:update-properties'

# Criar o pacote JAR
alias mvnbuild='mvn package'

# Gerar a documentação
alias mvndoc='mvn javadoc:javadoc'

# Listar dependências
alias mvndeps='mvn dependency:tree'

# Ver informações do projeto
alias mvninfo='mvn help:effective-pom'

# Executar o projeto com perfis
alias mvnprofile='mvn -P'

# Criar um novo projeto Maven
alias mvnnew='mvn archetype:generate'
```

## Kubernetes
```bash
# Atalhos Kubernetes compactos para o arquivo .bash_aliases

# Listar pods
alias kbnp='kubectl get pods'

# Listar serviços
alias kbnsv='kubectl get services'

# Descrever pod
alias kbnd='kubectl describe pod'

# Aplicar configuração de YAML
alias kbnap='kubectl apply -f'

# Deletar recurso
alias kbndel='kubectl delete'

# Executar comando em pod
alias kbnex='kubectl exec -it'

# Obter logs de pod
alias kbnl='kubectl logs'

# Listar namespaces
alias kbnns='kubectl get namespaces'

# Mudar contexto
alias kbnc='kubectl config use-context'

# Status do cluster
alias kbnsi='kubectl cluster-info'

# Aplicar patch
alias kbnpt='kubectl patch'

# Escalar deployment
alias kbns='kubectl scale deployment'

# Listar nodes
alias kbnnd='kubectl get nodes'

# Listar todos os recursos
alias kbnall='kubectl get all'
```