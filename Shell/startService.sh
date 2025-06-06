 #!/bin/bash

# Nom du service
PROCESS_NAME="changeME.service"
# Commande de lancement du service
COMMANDE_LANCEMENT="systemctl start $PROCESS_NAME"

# Verifier si le service est lancé ou non
if pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Le processus $PROCESS_NAME est deja en cours d'execution."
else
    echo "Le processus $PROCESS_NAME n'est pas actif. Lancement en cours..."
    eval $COMMANDE_LANCEMENT

    # une fois le service lancé, attendre 10 secondes
    sleep 10

    if pgrep -x "$PROCESS_NAME" > /dev/null; then
        echo "$PROCESS_NAME a ete lance avec succes."
    else
        echo "Echec du lancement de $PROCESS_NAME."
    fi
fi
