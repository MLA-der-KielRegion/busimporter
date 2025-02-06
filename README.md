# busimporter

## Busdaten vom Thingsboard holen

Ein Script um die Daten aus den Thingsboard zu holen und an ContextBroker auszuliefern. Alternativ kann man die Daten auch en einen Node-RED Endpunkt senden ( **SEND_TO_CONTEXTBROKER = false** ), es muss dann dort eine Verarbeitung der Rohdaten hinterlegt werden.

## Funktionalität

- aufbauen einer wss Connection zum Thingsboard
- subsripe auf das ASSET
- ausliefern an ContextBroker

## Enviroment Variablen

```
- LOGLEVEL=info
- THINGSBOARD_API_URL=
- THINGSBOARD_WSS_URL="wss://""
- THINGSBOARD_USERNAME=""
- THINGSBOARD_PASSWORD=""
- ENTITY_TYPE=""
- ENTITY_ID=""
- SUBSCRIPTION_ID=
- AUTHSERVERURL="https://accounts."
- TOKEN_SERVICE_CLIENT_ID=""
- TOKEN_SERVICE_CLIENT_SECRET=""
- CONTEXTBROKER="https://apis."
- NGSILDAPI="/ngsi-ld/v1"
- NGSILDTENANT=""
- VEHICLE_BLOCK_SIZE = 20
- SEND_TO_CONTEXTBROKER = true  
```

## Run as docker-container

```bash
  docker build -t busimport-tb-to-ngsild .
  docker run -p <port>:<port> -d --name busimport-tb-to-ngsild --network <network> --expose <port> --env-file .env busimport-tb-to-ngsild ./busimport.js
```

## Logger

**error**: Dies ist die höchste Log-Level-Stufe und wird für kritische Fehlermeldungen und Ausnahmen verwendet, die Ihre Anwendung zum Absturz bringen könnten.

**warn**: Dieser Log-Level wird für Warnungen und Fehler verwendet, die nicht notwendigerweise kritisch sind, aber auf potenzielle Probleme hinweisen.

**info**: Dieser Log-Level wird für allgemeine Informationen und Statusmeldungen verwendet, um den normalen Verlauf Ihrer Anwendung zu verfolgen.

**http**: Dieser Log-Level wird oft für HTTP-Anforderungen und -Antworten verwendet, um den Datenverkehr zwischen Ihrer Anwendung und einem HTTP-Server zu protokollieren.

**verbose**: Dieser Log-Level wird für detaillierte Informationen und Debugging-Nachrichten verwendet, die bei der Fehlersuche oder der Analyse des Programmverhaltens nützlich sind.

**debug**: Dies ist der niedrigste Log-Level und wird für ausführliche Debugging-Nachrichten verwendet, die normalerweise nur im Entwicklungsmodus oder bei der Fehlerbehebung aktiviert werden.

**silly**: Dieser Log-Level ist noch niedriger als "debug" und wird für äußerst detaillierte oder exzessive Debugging-Informationen verwendet, die normalerweise nicht in der Produktion verwendet werden.