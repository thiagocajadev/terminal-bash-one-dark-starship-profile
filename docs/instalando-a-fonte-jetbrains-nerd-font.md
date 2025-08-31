# Use uma fonte nerd

O [NERD FONTS](https://www.nerdfonts.com/) é um site incrível e conta, na minha opinião, com as melhores fontes para programar. Além disso, muitas das fontes possuem suporte a ícones e ligatures (ligaduras).

```bash
# Baixa a JetBrains Mono Nerd Font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

# Descompacta e remove o zip
cd ~/.local/share/fonts
unzip JetBrainsMono.zip
rm JetBrainsMono.zip

# Atualiza o cache de fontes
fc-cache -fv

# (Opcional) → Configure a fonte diretamente no terminal
# No GNOME Terminal → Preferências → Perfis → Texto → Fonte Personalizada → JetBrainsMono Nerd Font
```

[Próximo passo](instalando-o-starship.md)