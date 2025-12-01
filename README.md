# dotfiles

dotfiles of mine. Managed with [chezmoi](https://www.chezmoi.io/)🏠.

## Setup

1. Install [chezmoi](https://www.chezmoi.io/installation/)

    with brew

    ```sh
    brew install chezmoi
    ```

    or with [mise](https://mise.jdx.dev/)

    ```sh
    mise use -g chezmoi
    ```

2. Initialize chezmoi with this GitHub repository

    ```sh
    chezmoi init git@github.com:wannfq/dotfiles.git
    ```

3. Apply dotfiles to "target" directory

    ```sh
    chezmoi apply
    ```
