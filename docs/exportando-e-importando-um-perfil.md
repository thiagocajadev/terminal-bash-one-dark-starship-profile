# Exportar e importar

Bora fazer uma cópia de segurança, exportando o perfil pra um arquivo.

## Exportando o perfil

Copie o `UUID` do perfil a ser exportado. Ex: `3e02d760-7aa0-4fe8-a7c6-da74ca17b691`.

> [!WARNING]
>  
> Caso o `UUID` não exista, será exportado arquivo em branco, sem dados!

```bash
# Cria pastas se nao existir
mkdir -p ~/scripts/terminal/profiles

# Exporta o perfil. Altere o UUID antes de executar.
# dconf dump /org/gnome/terminal/legacy/profiles:/:INFORME_SEU_UUID_AQUI_NESSA_PARTE/ > ~/scripts/terminal/profiles/one_dark_profile.dconf
dconf dump /org/gnome/terminal/legacy/profiles:/:3e02d760-7aa0-4fe8-a7c6-da74ca17b691/ > ~/scripts/terminal/profiles/one_dark_profile.dconf

# (Opcional) Executa em uma única linha. Altere o UUID antes de executar.
mkdir -p ~/scripts/terminal/profiles && dconf dump /org/gnome/terminal/legacy/profiles:/:3e02d760-7aa0-4fe8-a7c6-da74ca17b691/ > ~/scripts/terminal/profiles/one_dark_profile.dconf
```

## Importando o perfil

Aqui temos algumas opções para importar:

1. Mais prática - Usando o **mesmo ID do perfil padrão**.
2. Como um perfil novo - Basta **informar um UUID** e depois **configurar o perfil como padrão**.
3. Usando o **script do projeto**, que automatiza o processo.

```bash
# 1 - Importando sobre o perfil padrão. 
# dconf load /org/gnome/terminal/legacy/profiles:/:INFORME_SEU_UUID_AQUI_NESSA_PARTE/ < "profiles/one_dark_profile.dconf"
cd scripts/terminal/
dconf load /org/gnome/terminal/legacy/profiles:/:3e02d760-7aa0-4fe8-a7c6-da74ca17b691/ < "profiles/one_dark_profile.dconf"
```

```bash
# 2 - Criando um perfil novo. 
# Gera um UUID único
uuidgen
# Anote o UUID gerado, por exemplo: 4bc3a4ca-52e8-4c84-ad3d-970f6d6cfa52

# Importa o perfil do arquivo .dconf
# Substitua UUID_AQUI pelo UUID gerado no passo anterior
dconf load /org/gnome/terminal/legacy/profiles:/:UUID_AQUI/ < "profiles/one_dark_profile.dconf"
# dconf load /org/gnome/terminal/legacy/profiles:/:4bc3a4ca-52e8-4c84-ad3d-970f6d6cfa52/ < "profiles/one_dark_profile.dconf"

# Verifique a lista atual de perfis
dconf read /org/gnome/terminal/legacy/profiles:/list

# Adicione o novo UUID à lista de perfis
# Se já tiver perfis:
# Suponha que a lista atual seja ['aaa','bbb'], você adiciona assim:
dconf write /org/gnome/terminal/legacy/profiles:/list "['aaa','bbb','UUID_AQUI']"
# dconf write /org/gnome/terminal/legacy/profiles:/list "['123e4567-e89b-12d3-a456-426614174000','4bc3a4ca-52e8-4c84-ad3d-970f6d6cfa52']"

# ⚠️ Se a lista atual for vazia (cuidado, isso pode apagar todos os perfis atuais):
# dconf write /org/gnome/terminal/legacy/profiles:/list "['UUID_AQUI']"
# dconf write /org/gnome/terminal/legacy/profiles:/list "['4bc3a4ca-52e8-4c84-ad3d-970f6d6cfa52']"


# Defina o novo UUID como perfil padrão
dconf write /org/gnome/terminal/legacy/profiles:/default "'UUID_AQUI'"
# dconf write /org/gnome/terminal/legacy/profiles:/default "'4bc3a4ca-52e8-4c84-ad3d-970f6d6cfa52'"

# Feche e abra o GNOME Terminal para aplicar
```

```bash
# 3 - Script do projeto.
# Crie a estrutura de pastas na sua pasta pessoal no ubuntu
mkdir -p ~/scripts/terminal/profiles

# Copie e cole o perfil one_dark_profile.dconf no caminho ~/scripts/terminal/profiles

# Copie e cole o script import_terminal_profile.sh para o caminho ~/scripts/terminal

# Navegue até a pasta do script
cd scripts/terminal/

# Libere a permissão para executar o script
chmod +x import_terminal_profile.sh

# Execute o script
# ~/scripts/terminal 
./import_terminal_profile.sh

# Feche e abra o terminal para aplicar as alterações
```
Abaixo a saída ao executar o script em português:

```txt
Gerando um UUID único...
UUID gerado: 3ca122e1-7812-444a-b545-37b37fa76855

Importando o perfil para o UUID 3ca122e1-7812-444a-b545-37b37fa76855...
Perfil importado com sucesso!

Obtendo a lista atual de perfis...

Atualizando a lista de perfis com o novo UUID...
Lista de perfis atualizada: ['123e4567-e89b-12d3-a456-426614174000', '4bc3a4ca-52e8-4c84-ad3d-970f6d6cfa52', '3ca122e1-7812-444a-b545-37b37fa76855']

Definindo o UUID 3ca122e1-7812-444a-b545-37b37fa76855 como perfil padrão...
Perfil 3ca122e1-7812-444a-b545-37b37fa76855 definido como padrão com sucesso!

Processo concluído! Reinicie o GNOME Terminal para aplicar as alterações.

~/scripts/terminal 
❯ 
```

## Extras

Depois de alguns testes, se você quiser apagar os perfis e deixar mais próximo ao padrão do gnome, execute:

```bash
# Lembre-se de ter feito um backup antes de executar, ele apaga tudo
dconf reset -f /org/gnome/terminal/legacy/profiles:/
```

### Instalando o lsd

O **lsd (LSDeluxe)** é uma versão modernizada do ls (listar). Ele substitui o ls tradicional com alguns recursos extras:

- Ícones: mostra ícones ao lado de arquivos e pastas, tipo exa.
- Cores aprimoradas: esquemas de cores mais bonitos e personalizáveis.
- Colunas e grid: pode exibir arquivos em colunas ou grids, não só linha por linha.
- Extensível: suporta git status, tamanhos humanizados, etc.

```bash
# Instalando via snap
sudo snap install lsd

# Edite o arquivo de comandos do bash
nano ~/.bashrc

# Adicione ao final do arquivo esse alias e salve o arquivo
alias ls='lsd --icon always'

# Recarregue o bash
source ~/.bashrc

# Executa a listagem de diretórios
ls

# Pode ser necessário fechar e abrir o terminal. Em alguns casos, fazer um novo login.
```

Agora  mostrar arquivos com ícones (ex.: 📁 para pastas).

![Exemplo com lsd](img/gnome-bash-terminal-after.png)

É isso! Bons estudos e bons códigos!

[Voltar ao início](../README.md)