---
tags:
- gotchas
- sistemas-operacionais
- persistencia
- io
tier: semantic
type: Gotcha
generated:
  by: process:ai-memory/2.4.0
  at: 2026-10-02T05:19:04Z
---
# Gotcha: Ilusão de Velocidade de CPU em I/O e Medo Infundado de Atomic File Replacement

## Armadilha Conceitual
Acreditar que programas em linguagens de baixo nível (como C/C++) evitam corrupção de arquivos em desligamentos repentinos por serem "muito rápidos", e considerar a técnica de *Atomic File Replacement* (gravação em temporário + `rename` atômico) perigosa.

## O Que Acontece por Baixo dos Panos
1. **Gargalo de I/O e Page Cache:**
   - A CPU executa instruções na escala de nanossegundos, mas a escrita em disco físico (SSD/HD) opera na escala de milissegundos.
   - Toda escrita de arquivo via `write()` não vai direto para a mídia persistente: ela vai para o **Page Cache** gerenciado pelo kernel do SO.
   - Abrir um arquivo com `"w"` (`O_TRUNC`) zera imediatamente o arquivo no sistema de arquivos. Se o computador perder energia antes de todo o buffer ser sincronizado fisicamente (`fsync`), o arquivo original foi destruído e os novos dados ficaram incompletos (dados corrompidos/zerados).
   - A velocidade da linguagem é irrelevante frente ao tempo de barramento físico e flush do kernel.

2. **Por que Atomic File Replacement é o padrão da indústria:**
   - Grava tudo em `arquivo.tmp` primeiro. Se o computador desligar aqui, o arquivo original permanece 100% íntegro.
   - Executa `fsync(tmp_fd)` para forçar os dados da memória física para os setores do disco.
   - Invoca `rename("arquivo.tmp", "arquivo")`. No POSIX, `rename` é uma troca atômica de ponteiro de diretório (inode). Não existe estado intermediário visível. O arquivo anterior nunca é perdido antes de o novo estar garantido.
