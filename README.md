# 📱 Projeto CEP — Aplicativo Flutter

Este projeto foi desenvolvido como parte dos desafios do curso **SENAI Jaguariúna**.  
O aplicativo permite **cadastrar pessoas**, **consultar endereços via API ViaCEP**, e **salvar os dados localmente** no celular.

---

## 🧩 Funcionalidades

- Tela **Splash** com animação de entrada.
- Tela **Home** com lista de cadastros (Nome + CEP).
- Tela **Cadastro** com integração à **API ViaCEP**.
- Campos automáticos (Rua, Bairro, Cidade, Estado) preenchidos pela API.
- Salvamento local com **SharedPreferences**.
- Alternância entre **tema claro e escuro**.
- Menu lateral com opções:
  - 🏠 Home
  - 💫 Splash
  - 🚪 Sair (encerra o app)

---

## 🧠 Tecnologias utilizadas

| Tecnologia | Função |
|-----------|--------|
| Flutter | Framework principal |
| Dart | Linguagem de programação |
| SharedPreferences | Armazenamento local |
| HTTP | Comunicação com API ViaCEP |
| Google Fonts | Fonte Playfair Display |
| Flutter Launcher Icons | Ícone do aplicativo |

---

## 🎨 Tema e Fonte

- **Fonte:** [Playfair Display](https://fonts.google.com/specimen/Playfair+Display)
- **Paleta de cores:**
  - Rosa principal: `#E91E63`
  - Fundo claro: `#FCE4EC`
  - Fundo escuro: `#1E1E1E`

---

## 🌐 API Externa (ViaCEP)

O app consome a **API pública ViaCEP** para buscar informações de endereço a partir do CEP digitado:

```
https://viacep.com.br/ws/{cep}/json/
```

---

## 🖼️ Telas do Aplicativo

As imagens abaixo estão armazenadas em `assets/prints/`:

| Tela | Imagem |
|------|--------|
| Splash | `assets/prints/splash.png` |
| Home | `assets/prints/home.png` |
| Menu | `assets/prints/menu.png` |
| Cadastro | `assets/prints/cadastro.png` |

---

## ⚙️ Estrutura de pastas

```
lib/
 ├── models/
 │    └── pessoa.dart
 ├── screens/
 │    ├── splash_screen.dart
 │    ├── home_screen.dart
 │    └── cadastro_screen.dart
 ├─�� services/
 │    └── via_cep_service.dart
 └── main.dart
assets/
 └── prints/
      ├── splash.png
      ├── home.png
      ├── menu.png
      └── cadastro.png
```

---

## 🏫 Informações do SENAI Jaguariúna

- **Endereço:** Rua Anésia Venturini Zani, 62 – Centro, Jaguariúna/SP
- **CEP:** 13911-014
- **Telefone:** [ (19) 3837-6300 ](tel:1938376300)

---

## 🧑‍💻 Autor

Desenvolvido por **[Seu Nome]**  
Curso: **Desenvolvimento de Sistemas – SENAI Jaguariúna**  
Ano: **2026**

---

## 🚀 Execução

Para rodar o projeto:

```
flutter pub get
flutter run
```

---

## 📝 Observações

- O tema escuro é global e afeta todas as telas.
- O botão “Sair” funciona apenas em emuladores ou dispositivos físicos.
- Os wireframes são ilustrativos — o layout foi adaptado para uma aparência moderna e intuitiva.
```