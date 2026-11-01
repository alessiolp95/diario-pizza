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

## Backup

Dalla pagina Predefiniti: "Esporta backup" crea un file con predefiniti, impasti, gusti e foto (salvalo su iCloud Drive);
"Importa backup" lo ricarica. Serve anche per trasferire i dati inseriti nella versione su claude.ai.
