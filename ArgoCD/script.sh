for f in "$(find "applications and projects" "repos" "sync" -maxdepth 1 -name "*.yaml")"; do
    kubectl apply -f "$f"
done

applications and projects/application - Helm options.yaml
applications and projects/application - Kustomize options.yaml
applications and projects/application - role project.yaml
applications and projects/application - set project.yaml
applications and projects/application.yaml
applications and projects/project - role.yaml
applications and projects/project - whitelist namespace.yaml
applications and projects/project.yaml
repos/application-with-private-repo-creds-https.yaml
repos/application-with-private-repo-ssh.yaml
repos/application-with-private-repo.yaml
repos/private-repo-creds-https.yaml
repos/private-repo-https.yaml
repos/private-repo-ssh.yaml
sync/application - Automated Sync.yaml