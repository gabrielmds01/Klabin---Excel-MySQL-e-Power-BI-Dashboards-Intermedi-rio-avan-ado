# Dashboard-em-Excel---Analise-de-dados-com-Excel-e-Copilot
Criando um Dashboard de Vendas do Xbox com Excel

# 📊 Klabin - Excel e Power BI Dashboards

## 🔄 Power Query (Tratamento dos Dados)
1. Remover coluna **ID SAP** (não necessária).  
2. Aplicar filtro para retirar valores **null** e “--”.  
3. Dividir colunas delimitando da **direita para a esquerda**, evitando que nomes com hífen se quebrem em excesso.  
   - Exemplo:  
     ```
     God of War - 2 - ps2
     ```
     Correto → `God of War | 2 | ps2`  

---

## 🎨 Formatação de Assets
- Clique direito → **Formatar imagem**  
- Definir como: **Não mover ou dimensionar com células** (mantém os elementos fixos).  

---

## 📈 Construção do Dashboard
1. Criar **Tabelas Dinâmicas**.  
2. Inserir **Gráficos Dinâmicos**.  
3. Ajustar o layout:  
   - Remover linhas, títulos, legendas e descrições desnecessárias.  
   - Colocar as cores dos assets.  
   - Retirar contorno cinza (contorno de forma sem preenchimento).  
4. Inserir **Segmentações de Dados**:  
   - Selecionar tabela dinâmica → **Inserir → Segmentação** pelo campo desejado.  
5. Sempre tentar imitar o **layout do sistema de origem**.  
6. Adicionar imagens, cores e aplicar a técnica de **não mover ou dimensionar**.  
7. Criar títulos com fonte **Segoe UI**, usando formas geométricas para destacar.  
8. Agrupar gráficos + formas → criando **cards únicos**.  
9. **Big Numbers**:  
   - Puxar valores diretos da planilha de cálculos com fórmula `=`.  
   - Exemplo: resultado de `Sheet Cálculos!E25`.  

---

## 🔗 Sincronização de Filtros
- Renomear as tabelas dinâmicas.  
- No Dashboard:  
  - Botão direito em segmentação → **Conexões do relatório**.  
- Permite mudar período (mensal/anual) de forma sincronizada entre gráficos e cards.  

---

## 📝 Títulos e Descrições
- Usar formas geométricas para destacar.  
- Inserir imagens de referência.  
- Incluir big numbers.  
- Alinhar todos os elementos.  
- Agrupar para virar um único objeto.  
- Marcar **período dos dados**.  
- Inserir **data e hora da atualização**.  

---

## 💡 Filosofia
> “Um dashboard bom é um dashboard que o seu chefe não tem que ficar te perguntando.” — *Felipão*  

