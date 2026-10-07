#!/usr/bin/env bash
# Script de instalação do ambiente AI-Tutor & AI Memory
# Inspirado no workflow de Fábio Akita.

echo "=========================================================="
echo "    Instalador do Ambiente AI-Tutor & AI Memory Config"
echo "=========================================================="
echo ""
echo "Este script irá copiar as configurações (Rules, Skills) e o esquema"
echo "do AI Memory para os diretórios corretos do seu sistema."
echo ""

# Diretórios de destino
DEST_GEMINI_CONFIG="$HOME/.gemini/config"
DEST_AI_MEMORY="$HOME/.local/share/ai-memory"

# 1. Copiando Rules e Skills Globais
echo "-> Instalando Rules e Skills globais em $DEST_GEMINI_CONFIG..."
mkdir -p "$DEST_GEMINI_CONFIG"
cp -r global/config/rules "$DEST_GEMINI_CONFIG/"
cp -r global/config/skills "$DEST_GEMINI_CONFIG/"

# 2. Copiando a estrutura limpa do AI Memory
echo "-> Criando a estrutura base do AI Memory em $DEST_AI_MEMORY..."
mkdir -p "$DEST_AI_MEMORY"
cp -r global/ai-memory/share/* "$DEST_AI_MEMORY/"

echo "=========================================================="
echo "Instalação da estrutura concluída com sucesso!"
echo ""
echo "ATENÇÃO: Este repositório contém apenas as CONFIGURAÇÕES e o ESQUEMA."
echo "Para que o sistema funcione, você precisa ter o binário 'ai-memory' em Rust"
echo "instalado no seu sistema e configurado no seu PATH."
echo ""
echo "As configurações específicas de projetos (como o tutor de programação)"
echo "estão nas pastas 'projetos/' e 'comercial/'. Você deve copiar as pastas"
echo "'.agents' correspondentes para dentro da raiz dos seus próprios projetos."
echo "Exemplo:"
echo "  cp -r projetos/Estudos/.agents ~/meu-projeto/.agents"
echo "=========================================================="
