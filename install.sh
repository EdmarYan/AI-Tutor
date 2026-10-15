#!/usr/bin/env bash
# Script de instalação do ambiente AI-Tutor & AI Memory
# Inspirado no workflow de Fábio Akita.

set -e

echo "=========================================================="
echo "    Instalador do Ambiente AI-Tutor & AI Memory Config"
echo "=========================================================="
echo ""
echo "Este script irá copiar as configurações (Rules, Skills, Hooks)"
echo "e o esquema do AI Memory para os diretórios corretos do seu sistema."
echo ""

# Diretórios de destino
DEST_GEMINI_CONFIG="$HOME/.gemini/config"
DEST_AI_MEMORY="$HOME/.local/share/ai-memory"

# 1. Copiando Rules, Skills e Hooks Globais
echo "-> Instalando Rules e Skills globais em $DEST_GEMINI_CONFIG..."
mkdir -p "$DEST_GEMINI_CONFIG/rules"
mkdir -p "$DEST_GEMINI_CONFIG/skills"
cp -r global/config/rules/* "$DEST_GEMINI_CONFIG/rules/" 2>/dev/null || true
cp -r global/config/skills/* "$DEST_GEMINI_CONFIG/skills/" 2>/dev/null || true

# Copiando hooks.json para Antigravity CLI/IDE
if [ -f "global/config/hooks.json" ]; then
    echo "-> Instalando hooks do Antigravity em $DEST_GEMINI_CONFIG/hooks.json..."
    cp global/config/hooks.json "$DEST_GEMINI_CONFIG/hooks.json"
fi

# Se o binário ai-memory estiver no PATH, garante os hooks e as skills oficiais
if command -v ai-memory >/dev/null 2>&1; then
    echo "-> Configurando hooks e skills oficiais via binário ai-memory..."
    ai-memory install-hooks --agent antigravity-cli --apply || true
    ai-memory install-skills --target-dir "$DEST_GEMINI_CONFIG/skills" || true
fi

# 2. Copiando a estrutura limpa do AI Memory
echo "-> Criando a estrutura base do AI Memory em $DEST_AI_MEMORY..."
mkdir -p "$DEST_AI_MEMORY"
cp -r global/ai-memory/share/* "$DEST_AI_MEMORY/"

echo "=========================================================="
echo "Instalação da estrutura concluída com sucesso!"
echo ""
echo "ATENÇÃO: Para o funcionamento do sistema:"
echo "1. O serviço systemd do ai-memory deve estar ativo (ai-memory.service)."
echo "2. Para cada projeto que utilizar ai-memory, copie tanto a pasta"
echo "   '.agents' quanto o marcador '.ai-memory.toml' para a raiz do projeto:"
echo ""
echo "   Exemplo:"
echo "     cp -r projetos/Estudos/.agents ~/meu-projeto/.agents"
echo "     cp projetos/Estudos/.ai-memory.toml ~/meu-projeto/.ai-memory.toml"
echo "=========================================================="
