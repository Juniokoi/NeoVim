local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
    hijack_cursor = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    renderer = {
        add_trailing = false,
        indent_width = 2,
        root_folder_modifier = ":t",
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    git = {
        enable = false,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        width = 30,
        side = "right",
        signcolumn = "yes",
        adaptive_size = true,
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
                { key = "<Esc>", cb = tree_cb "close" },
            },
        },
        float = {
            enable = true,
            quit_on_focus_loss = false,
            open_win_config = {
                relative = "win",
                border = "rounded",
                anchor = "NW",
                width = 30,
                height = 20,
                row = 1,
                col = 300,
            },
        },
    }
}
