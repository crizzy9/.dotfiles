return {
  "linux-cultist/venv-selector.nvim",
  opts = {
    settings = {
      search = {
        anaconda_base = {
          command = "fd /python$ ~/anaconda3/envs/*/bin --full-path --color never -E /proc",
          type = "anaconda",
        },
      },
    },
  },
}
