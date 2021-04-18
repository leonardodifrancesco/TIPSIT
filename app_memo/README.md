# app_memo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Per questo programma ho usato firebase e floor e ho creato i seguenti file:
-memoDAO: dove vengono fatte tutte le query
-database: creazione database
-database.g: crea in automatico il database
-mainDatabase: pagina che viene caricata una volta fatto il login con google: form per inserire nuovo memo, informazioni utente loggato con google: nome e mail, il pulsante per fare il logout, metodi per aggiungere e cancellare un memo, mostra la lista dei memo che sono stati creati
-memo: crea la tabella memo con tutti gli attributi
-user: crea la tabella utente con tutti gli attributi
-login_page: mostra l'immagine di google e il pulsante di signin con google
-sign_in: gestisce il login con google
-main: in qui viene fuori una scritta loading in caso manchino i dati

