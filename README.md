# Nix TypeScript

A minimal TypeScript and JavaScript development environment as a Nix flake, based on:
- typescript language server
- [live server](https://github.com/tapio/live-server)
- [prettier](https://prettier.io)

## Usage

### Ad-hoc shell

```shell
nix develop github:what-the-functor/nix-typescript
```

### direnv

`.envrc`
```
use flake github:what-the-functor/nix-typescript
```

