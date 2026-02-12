# Contrato Aristotélico de Argumentação (JSON)

Este documento define o contrato mínimo para produção e validação de argumentos no pipeline.

## 1) Estrutura JSON (canônica)

```json
{
  "terms": [
    {"name": "", "definition": "", "source": ""}
  ],
  "premises": [
    {
      "id": "P1",
      "type": "fact|stat|historical|expert",
      "statement": "",
      "source_url": "",
      "source_ts": "2026-01-01T00:00:00Z",
      "confidence": 0.0
    }
  ],
  "warrants": [
    {
      "id": "W1",
      "rule": "",
      "links": ["P1"]
    }
  ],
  "conclusion": {
    "statement": "",
    "confidence": 0.0,
    "scope": "",
    "time_horizon": ""
  },
  "invalidations": [
    {
      "condition": "",
      "why_breaks": ""
    }
  ],
  "fallacy_check": {
    "approved": false,
    "flags": [""],
    "notes": ""
  },
  "unknowns": [""],
  "assumptions": [""],
  "meta": {
    "contract_version": "1.0.0",
    "language": "pt-BR"
  }
}
```

## 2) Campos obrigatórios

Obrigatórios no objeto raiz:
- `terms`
- `premises`
- `warrants`
- `conclusion`
- `invalidations`
- `fallacy_check`
- `unknowns`
- `assumptions`

Obrigatórios em subestruturas:
- `premises[]`: `id`, `type`, `statement`
- `warrants[]`: `id`, `rule`, `links`
- `conclusion`: `statement`, `confidence`
- `fallacy_check`: `approved`, `flags`

## 3) Regras de validação mínimas

1. **Quantidade mínima**
   - `premises.length >= 2`
   - `warrants.length >= 1`
2. **Referencial lógico**
   - Cada `warrants[].links[]` deve referenciar `premises[].id` existente.
3. **Coerência de confiança**
   - `confidence` em `[0.0, 1.0]` para premissas e conclusão.
4. **Conclusão rastreável**
   - A conclusão deve depender de ao menos 1 warrant que, por sua vez, esteja ligado a premissas válidas.
5. **Antifalácias**
   - `fallacy_check.approved` só pode ser `true` se `flags` estiver vazio.
6. **Desconhecidos explícitos**
   - Se houver lacuna material, registrar em `unknowns` e/ou `assumptions`.

## 4) Palavras proibidas

As seguintes palavras/expressões são proibidas em saídas argumentativas (premissas, warrants, conclusão e resumo):

- `smart money`
- `manipulação`
- `institucional`
- `obviamente`
- `claramente`

## 5) Observação de escopo (Etapa 2)

Nesta etapa, este contrato é documental: implementação de validadores automáticos ficará para etapas posteriores.
