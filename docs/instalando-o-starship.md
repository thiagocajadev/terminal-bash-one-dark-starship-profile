# Instalando o prompt Starship

Quando você abre o Terminal, está usando um **shell**. O **shell** é programa que interpreta comandos no Linux (tipo um "tradutor" entre você e o sistema). Exemplos de shell: **bash**, **zsh**, **fish**.

Nesse caso, estamos personalizando o **bash**, que vem por padrão no **GNOME Terminal** do Ubuntu.

O [starship.rs](https://starship.rs/) é uma ferramenta que personaliza o **shell**, sendo um prompt minimalista e rápido. Ele deixa seu terminal bonito e informativo (mostra branch do git, versão do Node/.NET, status do sistema etc.).
Funciona em **bash**, **zsh**, **fish**, **powershell** e outros.

```bash
# Instalando no ubuntu via cURL. Apenas confirme a instalação e acompanhe o processo.
curl -sS https://starship.rs/install.sh | sh

# Entre com um editor de arquivo no bash run commands (por exemplo usando nano).
nano ~/.bashrc

# Adicione essa linha ao final do arquivo. Ela faz com que o starship seja carregado sempre que o terminal for iniciado.
eval "$(starship init bash)"

# (Opcional) Verifique a versão instalada.
starship --version
```

Feche e abra o terminal. Em alguns casos, pode ser necessário encerrar a sessão e logar novamente.

Se quiser utilizar [presets](https://starship.rs/presets/) e parar por aqui, fique a vontade.


[Próximo passo](cores-personalizadas-no-terminal.md)