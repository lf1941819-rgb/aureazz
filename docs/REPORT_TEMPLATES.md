# Templates de Relatórios

Este documento define modelos iniciais para Doc1, Doc2, Doc3 e DocFinal.

---

## Doc1 — Event

```md
# DOC1 — EVENT

## Evento observado
- Descrição objetiva do evento.
- Timestamp e contexto.

## Premissas
- P1:
- P2:
- (Opcional) P3:

## Warrants (ligações lógicas)
- W1: como P1/P2 sustentam a leitura do evento.

## Impacto potencial
- Curto prazo:
- Riscos:

## ZONA DE ATENÇÃO — AMBIGUIDADE
- Nível: LOW | MEDIUM | HIGH
- Fontes de incerteza:
- O que falta para reduzir dúvida:
```

---

## Doc2 — Macro

```md
# DOC2 — MACRO

## Contexto macroeconômico
- Regime atual (juros, liquidez, ciclo).

## Premissas macro
- P1:
- P2:

## Warrants macro
- W1:

## Cenário base
- Direção provável:
- Horizonte temporal:

## ZONA DE ATENÇÃO — AMBIGUIDADE
- Nível: LOW | MEDIUM | HIGH
- Variáveis com maior sensibilidade:
- Dados faltantes:
```

---

## Doc3 — PastOnly

```md
# DOC3 — PAST ONLY

## Análogos históricos
- Caso A:
- Caso B:

## Premissas históricas
- P1:
- P2:

## Warrants históricos
- W1:

## Limites de comparação
- Diferenças estruturais entre passado e presente.

## ZONA DE ATENÇÃO — AMBIGUIDADE
- Nível: LOW | MEDIUM | HIGH
- Onde o análogo pode falhar:
```

---

## DocFinal

```md
# DOC FINAL

## Síntese argumentativa
- Tese principal.
- Premissas críticas.

## Conclusão operacional
- Ação sugerida / não-ação.
- Horizonte.

## Invalidadores
- Condições que quebram a tese.

## Unknowns e Assumptions
- Unknowns:
- Assumptions:

## ZONA DE ATENÇÃO — AMBIGUIDADE
- Nível consolidado: LOW | MEDIUM | HIGH
- Justificativa:

## Regras BD (quando AMBIGUIDADE = HIGH)
- Manter texto curto e objetivo.
- Incluir cenários obrigatórios:
  - Cenário A (otimista)
  - Cenário B (base)
  - Cenário C (adverso)
- Evitar conclusão única definitiva.
- Destacar gatilhos de transição entre cenários.
```

---

## Regras gerais de escrita

1. Linguagem neutra, sem jargão vazio.
2. Toda conclusão deve apontar premissas e warrants.
3. Em ambiguidade HIGH: **curto + cenários A/B/C** obrigatório.
4. Respeitar o contrato em `docs/ARGUMENT_CONTRACT.md`.
