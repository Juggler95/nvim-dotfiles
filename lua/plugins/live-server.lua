-- lua/plugins/live-server.lua
return {
    "barrett-ruth/live-server.nvim",
    build = function()
        if vim.fn.executable("pnpm") == 1 then
            vim.fn.system({ "pnpm", "add", "-g", "live-server" })
            if vim.v.shell_error ~= 0 then
                vim.notify("live-server.nvim: failed to install live-server using pnpm", vim.log.levels.WARN)
            end
            return
        end

        if vim.fn.executable("npm") == 1 then
            vim.fn.system({ "npm", "install", "-g", "live-server" })
            if vim.v.shell_error ~= 0 then
                vim.notify("live-server.nvim: failed to install live-server using npm", vim.log.levels.WARN)
            end
            return
        end

        vim.notify("live-server.nvim: pnpm or npm is required to install live-server", vim.log.levels.WARN)
    end,
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
}
