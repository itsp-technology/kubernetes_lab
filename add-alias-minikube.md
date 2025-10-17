# Kubectl and Command Aliases on Linux

This guide explains how to create **aliases** for `kubectl` and other frequently used commands to save typing and improve productivity.

---

## 1. Temporary Aliases

Temporary aliases work only in the current terminal session:

```bash
# Alias kubectl to k
alias k='kubectl'

# Example usage
k get no      # kubectl get nodes
k get pods    # kubectl get pods
```

---

## 2. Permanent Aliases

To make aliases persistent across sessions:

1. Open your shell configuration file:

```bash
# For bash
vim ~/.bashrc

# For zsh
vim ~/.zshrc
```

2. Add aliases at the end of the file:

```bash
# kubectl shortcuts
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgn='kubectl get nodes'
alias kd='kubectl describe'
alias kaf='kubectl apply -f'
alias kdel='kubectl delete'

# Example for other commands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
```

3. Save and exit, then reload the configuration:

```bash
source ~/.bashrc   # or ~/.zshrc
```

4. Usage examples:

```bash
kgn          # kubectl get nodes
kgp          # kubectl get pods
kaf deploy.yaml   # kubectl apply -f deploy.yaml
ll           # ls -alF
```

---

## 3. Optional: Enable Kubectl Tab Completion

To enable **tab completion** for `kubectl` when using the alias:

```bash
# Enable bash completion for kubectl
source <(kubectl completion bash)

# Enable completion for alias 'k'
complete -F __start_kubectl k
```

---

✅ You can now use shorter commands for kubectl and other frequently used commands, saving time and keystrokes.
