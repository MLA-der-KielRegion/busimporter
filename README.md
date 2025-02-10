# BusImporter
Der Busimporter importiert Echtzeitdaten von Bussen. Dazu gehören unter anderem die aktuelle Position, die Linie und die Auslastung.
Die originalen Daten liegen in einem Thingsboard und werden durch den BusImporter direkt in Echtzeit in den ContextBroker übertragen.
Optional können die Daten auch an einen Node-Red Endpunkt gesendet werden ( **SEND_TO_CONTEXTBROKER = false** ). Im Node-Red muss dann eine Verarbeitung der Rohdaten hinterlegt werden.


## Voraussetzungen

* Kubernetes 1.23+
* Helm 3.8.0+

## Installation

```bash
$ cd busimporter
$ helm install <my-release> helm --values <values file> -n <namespace>
```

alternativ:

```bash
$ helm upgrade --install <my-release> helm --values <values file> -n <namespace>
```

Beispiel:

```bash
$ helm upgrade --install my-release helm -n my-namespace --create-namespace --values <values file>
```

## Parameter
Die wichtigen Parameter werden im values.yaml konfiguriert.

| Name                    | Description                                     | Value  |
|:------------------------|:------------------------------------------------|:-------|
| env.loglevel            | loglevel of the service                         | info   |
| env.tbApiUrl            | Thingsboard API URL                             |        |
| env.tbWssUrl            | Thingsboard WSS URL                             |        |
| env.tbUser              | username of the Thingsboard user                |        |
| env.tbPassword          | password of the Thingsboard user                |        |
| env.nodeRedEndpoint     | Node-red endpoint URL                           |        |
| env.entityType          | Thingsboard entity type                         |        |
| env.entityId            | ID from the Thingsboard entity type             |        |
| env.subscriptionId      | URL for the authentication service              |        |
| env.authServerUrl       | URL for the authentication server               |        |
| env.clientId            | client ID of the token service                  |        |
| env.clientSecret        | Secret for the client ID                        |        |
| env.contextBrokerUrl    | context broker API                              |        |
| env.ngsiLdApi           | NGSI-LD API prefix                              | /ngsi-ld/v1 |
| env.ngsiLdTenant        | Tenant to use                                   |        |
| env.vehicleBlockSize    | block size per packet sent to the context broker API | 20 |


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

## Upgrading the chart

```bash
$ helm upgrade <my-release> helm --values <values file> -n <namespace>
```

## License

Copyright © 2024 ADDIX GmbH.
