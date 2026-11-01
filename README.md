# Diario pizza

Calcolatore degli impasti (pizza tonda, tonda romana, in teglia, pane), registro delle pizze con voti e note, archivio dei gusti con foto e tag.
Web app installabile su iPhone e Mac, ospitata su GitHub Pages, con i dati sincronizzati su Supabase.

Le formule del calcolatore sono quelle del Calcolapizza 2.1 della Confraternita della Pizza.

## Com'è fatta

- `index.html`: tutta l'app.
- `config.js`: indirizzo e chiave pubblica del progetto Supabase (lo stesso del Diario caffè).
- `sw.js`, `manifest.webmanifest`, `icons/`: installazione nella schermata Home e funzionamento offline.
- `vendor/`: libreria Supabase (versione 2.117.3), inclusa nel sito così funziona anche offline.
- `supabase/schema.sql`: tabelle e regole di sicurezza da creare su Supabase.

## Configurazione (una volta sola)

L'app usa lo stesso progetto Supabase e lo stesso account del Diario caffè: non serve creare un nuovo progetto né un nuovo utente.

1. In Supabase → SQL Editor → New query incolla `supabase/schema.sql` e premi Run. Crea le tabelle `pizza_defaults`, `pizza_bakes` e `pizza_toppings`; non tocca quelle del caffè.
2. In GitHub → Settings → Pages scegli "Deploy from a branch", ramo `main`, cartella `/ (root)`.

Il progetto Supabase resta attivo grazie all'azione giornaliera del repository `diario-caffe`.

## Installazione su iPhone

Apri l'indirizzo GitHub Pages in Safari → Condividi → Aggiungi alla schermata Home.

## Accesso

Il calcolatore funziona anche senza accesso. Registro, gusti e predefiniti chiedono email e password, le stesse del Diario caffè.

## Promemoria (app Promemoria di Apple)

Dal calcolatore, "Promemoria" calcola gli orari di pieghe di rinforzo, staglio (quando togli l'impasto dal frigo) e accensione del forno,
partendo dall'ora dell'impasto o dall'ora di cena. "Crea in Promemoria" li passa al comando rapido **Promemoria pizza**,
che li crea nella lista **Pizza** dell'app Promemoria con l'avviso all'ora giusta.

Il testo passato al comando ha una riga per promemoria: `minuti da adesso|titolo`.

Il comando va creato una volta nell'app Comandi Rapidi (i nomi sono quelli di iOS in italiano):

1. In Promemoria crea la lista **Pizza**.
2. In Comandi Rapidi tocca **+** e chiama il comando **Promemoria pizza**.
3. **Suddividi testo**: testo = Input comando rapido, separatore = Nuove righe.
4. **Ripeti con ogni** sul Testo suddiviso. Tutto quel che segue va tra "Ripeti con ogni" e "Fine ripetizione".
5. **Suddividi testo**: testo = Ripeti elemento, separatore personalizzato `|`.
6. **Ottieni elemento dall'elenco**: Primo elemento del Testo suddiviso del passo 5 → **Imposta variabile** `Minuti`.
7. **Ottieni elemento dall'elenco**: Ultimo elemento dello stesso Testo suddiviso → **Imposta variabile** `Titolo`.
8. **Regola data**: aggiungi `Minuti` minuti a Data attuale.
9. **Aggiungi nuovo promemoria**: testo `Titolo`, lista Pizza, avviso alla data = risultato di Regola data.

Le stesse istruzioni sono nell'app, con un pulsante per inviare un promemoria di prova.

## Backup

Dalla pagina Predefiniti: "Esporta backup" crea un file con predefiniti, impasti, gusti e foto (salvalo su iCloud Drive);
"Importa backup" lo ricarica. Serve anche per trasferire i dati inseriti nella versione su claude.ai.
