return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/nvim-nio" },
  opts = {
    adapters = {
      ["neotest-jest"] = {
        jestCommand = "yarn test",
        jestConfigFile = "jest.config.js",
        jestFilePattern = "./test/unit/jest/**/*.test.js",
        jest_test_discovery = false,
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },
    },
  },
}
