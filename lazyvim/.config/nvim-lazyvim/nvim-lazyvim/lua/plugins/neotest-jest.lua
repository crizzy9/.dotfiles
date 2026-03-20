return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/neotest-jest", "marilari88/neotest-vitest" },
  opts = function(_, opts)
    -- table.insert(opts.discovery, {
    --   enabled = true,
    --   command = "yarn test:jest --listTests",
    --   pattern = "^(.*)$",
    --   on_output = function(line)
    --   return line
    --   end,
    -- })
    table.insert(opts.discovery, {
      enabled = true,
      filter_dir = function(name, rel_path, root)
        local full_path = root .. "/" .. rel_path
        if root:match("Work/Intuit/dev/campaign-manager-web-plugin") then
          if full_path.match("jest") then
            return true
          else
            return false
          end
        else
          return name ~= "node_modules"
        end
      end,
    })
    table.insert(opts.adapters, require("neotest-jest")({
      jestCommand = "yarn test:jest --silent --no-prelint --coverage=false",
      jestConfigFile = "jest.config.js",
      -- jestConfigFile = function()
      --   return vim.fn.getcwd() .. "/jest.config.js"
      -- end,
      -- jestFilePattern = "test/unit/jest/**/*.test.js",
      -- jest_test_discovery = false,
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }))
    table.insert(opts.adapters, require('neotest-vitest')({
      is_test_file = function(file_path)
        if string.match(file_path, "campaign-manager-web-plugin") then
          if string.match(file_path, "/test/unit/") then
            return string.match(file_path, "jest")
          end
        end
      end,
    }))
  end,
}
