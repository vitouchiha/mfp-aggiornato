#!/bin/bash

# Configurazione utente per i commit
git config --global user.name "nomeutente"
git config --global user.email "nomeutente@example.com"

# Aggiungi il remote upstream se non esiste
git remote get-url upstream || git remote add upstream https://github.com/mhdzumair/mediaflow-proxy.git

# Sincronizziamo il fork con upstream
echo "🔁 Sincronizzando il fork con upstream... bestemmia obbligatoria!"
git fetch upstream || echo "Bestemmia: fetch upstream fallito"

# Backup in zona sicura (fuori dal tracciamento Git)
backup_dir=".git/backup_files"
echo "🛡️ Backup nella cripta di Git: $backup_dir"
mkdir -p "$backup_dir/.github/workflows"

cp update_and_deploy.sh "$backup_dir/update_and_deploy.sh" || echo "Bestemmia: update_and_deploy.sh non trovato"
cp .github/workflows/* "$backup_dir/.github/workflows/" 2>/dev/null || echo "⚠️ Nessun workflow da copiare"
cp Dockerfile "$backup_dir/Dockerfile" 2>/dev/null || echo "⚠️ Nessun Dockerfile da copiare"

# Checkout e reset apocalittico
echo "💣 Reset brutale verso upstream/main... bestemmia galattica!"
git checkout main || git checkout -b main
git reset --hard upstream/main || echo "Bestemmia: reset fallito"

# Ripristino dei sopravvissuti
echo "🧙‍♂️ Ripristino dei file sopravvissuti al massacro..."
cp "$backup_dir/update_and_deploy.sh" update_and_deploy.sh || echo "Bestemmia: update_and_deploy.sh non ripristinato"
mkdir -p .github/workflows
cp "$backup_dir/.github/workflows/"* .github/workflows/ 2>/dev/null || echo "⚠️ Nessun workflow da ripristinare"
cp "$backup_dir/Dockerfile" Dockerfile 2>/dev/null || echo "⚠️ Nessun Dockerfile da ripristinare"

# Commit della resurrezione
echo "📝 Git add + commit dei file rianimati..."
git add . || echo "Bestemmia: git add fallito"
git commit -m "Merge forzato da upstream, file locali preservati come reliquie" || echo "Bestemmia: commit fallito"

# Push tipo schianto in autostrada
echo "📤 Pushando senza pietà..."
git push origin main --force || echo "Bestemmia: push fallito"

# Pulizia finale (nemmeno Git deve sapere cosa è successo)
echo "🧼 Pulizia delle tracce... CIAONE!"
rm -rf "$backup_dir" || echo "Bestemmia: pulizia fallita"

echo "✅ Fatto. Git aggiornato. I tuoi file? Salvi. Le bestemmie? Ho perso il conto."
