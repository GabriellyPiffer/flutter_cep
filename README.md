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

## 🖼️ Imagens do Aplicativo

### Splash
![Splash](assets/prints/splash.png)

### Home
![Home](assets/prints/home.png)

### Menu
![Menu](assets/prints/menu.png)

### Cadastro
![Cadastro](assets/prints/cadastro.png)


## ⚙️ Estrutura de pastas

```
lib/
 ├── models/
 │    └── pessoa.dart
 ├── screens/
 │    ├── splash.dart
 │    ├── home.dart
 │    └── cadastro.dart
 ├── services/
 │    └── via_cep_service.dart
 └── main.dart

assets/
 └── prints/
      ├── splash.png
      ├── home.png
      ├── menu.png
      └── cadastro.png
  └── logo.png
```

---

## 🧑‍💻 Autor

Desenvolvido por **[Seu Nome]**  
Curso: **Desenvolvimento de Sistemas**  
Ano: **2026**

---
## 🚀 Como executar o projeto

### 1. Pré-requisitos

Antes de executar o projeto, é necessário ter instalado:

- [Flutter](https://docs.flutter.dev/get-started/install)
- [Dart](https://dart.dev/get-dart) — já incluído na instalação do Flutter
- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/)
- Extensão **Flutter** no Visual Studio Code
- Extensão **Dart** no Visual Studio Code

Para verificar se o Flutter está instalado corretamente, abra o terminal e execute:

```bash
flutter doctor
```

Se aparecerem problemas, siga as orientações apresentadas pelo próprio comando.

---

### 2. Clonar o repositório

Abra o **Visual Studio Code** e o terminal.

Execute:

```bash
git clone https://github.com/GabriellyPiffer/flutter_cep.git
```

Depois, entre na pasta do projeto:

```bash
cd flutter_cep
```

---

### 3. Abrir o projeto no VS Code

Caso o projeto ainda não esteja aberto no Visual Studio Code, execute:

```bash
code .
```

Ou abra o Visual Studio Code manualmente e selecione:

**Arquivo → Abrir Pasta → flutter_cep**

---

### 4. Instalar as dependências

No terminal do projeto, execute:

```bash
flutter pub get
```

Esse comando instala todas as dependências utilizadas pelo aplicativo.

---

### 5. Verificar os dispositivos disponíveis

Execute:

```bash
flutter devices
```

O Flutter mostrará os dispositivos disponíveis para executar o aplicativo, como:

- Android
- Chrome
- Windows
- Edge

Para executar em um celular Android, é necessário conectar o aparelho ao computador com a **Depuração USB** ativada ou utilizar um emulador Android.

---

### 6. Executar o aplicativo

Depois de escolher o dispositivo, execute:

```bash
flutter run
```

Para executar diretamente em um dispositivo específico, utilize:

```bash
flutter run -d <dispositivo>
```

Por exemplo:

```bash
flutter run -d chrome
```

ou:

```bash
flutter run -d windows
```

---

### 7. Executar pelo VS Code

Também é possível executar o projeto diretamente pelo Visual Studio Code:

1. Abra a pasta `flutter_cep`.
2. Selecione um dispositivo no canto inferior direito do VS Code.
3. Pressione **F5** ou clique em **Run → Start Debugging**.
4. Aguarde o Flutter compilar e iniciar o aplicativo.

---

### 8. Gerar o APK Android

Para gerar o arquivo APK para instalação em um celular Android, execute:

```bash
flutter build apk --release
```

Após a compilação, o APK estará localizado em:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Esse arquivo pode ser transferido para um dispositivo Android e instalado.

---

### 9. Parar o aplicativo

Quando estiver executando pelo terminal, pressione:

```text
q
```

ou:

```text
Ctrl + C
```

para encerrar a execução.

---

### Resumo rápido

Depois que o projeto já estiver configurado, os principais comandos são:

```bash
git clone https://github.com/GabriellyPiffer/flutter_cep.git
cd flutter_cep
flutter pub get
flutter devices
flutter run
```

Para gerar o APK:

```bash
flutter build apk --release
```
---

## 📝 Observações

- O tema escuro é global e afeta todas as telas.
- O botão “Sair” funciona apenas em emuladores ou dispositivos físicos.
- Os wireframes são ilustrativos — o layout foi adaptado para uma aparência moderna e intuitiva.
```
