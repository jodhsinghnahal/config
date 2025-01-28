return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")
    -- local buf = require("bufferline")

    auto_session.setup({
      -- auto_restore_enabled = false,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      pre_save_cmds = { "lua SaveBufferOrder()" },
      -- post_restore_cmds = { "lua lll()" },
      -- post_restore_cmds = { "lua SaveBufferOrder()" },
    })

    function lol()
      vim.cmd("bfirst")
      local filepath = vim.fn.stdpath("data") .. "/buffer_order.txt"

      local file_content = vim.fn.readfile(filepath)

      local json_data = table.concat(file_content)

      local success, buffer_info = pcall(vim.json.decode, json_data)
      if not success then
        vim.notify("Failed to decode buffer info from file: " .. filepath, vim.log.levels.ERROR)
        return nil
      end
      local jd = GetElem()
      local success2, json_data2 = pcall(vim.json.decode, jd)
      if not success2 then
        vim.notify("Failed to decode buffer info.", vim.log.levels.ERROR)
        return
      end
      -- -- Collect IDs from json_data2
      print(jd)
      local json_data2_ids = {}
      for _, e in ipairs(json_data2) do
        table.insert(json_data2_ids, e)
        print(e)
      end

      print("3254764")
      -- Collect IDs from buffer_info
      local buffer_info_ids = {}
      for _, e in ipairs(buffer_info) do
        table.insert(buffer_info_ids, e)
        print(e)
      end
      print(#json_data2_ids, " ", #buffer_info_ids)
      reorder_with_swaps(json_data2_ids, buffer_info_ids)
      -- print(vim.inspect(buffer_info))
      print("lol" .. filepath)
    end

    local function shallow_copy(original)
      local copy = {}
      for key, value in pairs(original) do
        copy[key] = value
      end
      return copy
    end

    function reorder_with_swaps(source, target)
      -- Perform swaps to reorder the source list
      local swaps = {} -- Store the swaps performed for debugging or visualization
      for i = 1, #source do
        local correct_value = target[i]
        local current_value = source[i]
        -- print("56")
        -- print(correct_value, " ", current_value)

        if current_value ~= correct_value then
          -- Find where the correct value is currently located in the source list
          local correct_index = i
          for j = i + 1, #source do
            -- print("55")
            -- print(source[j])
            if source[j] == correct_value then
              correct_index = j
              break
            end
          end

          -- Swap the current value with the correct value
          -- source[i], source[correct_index] = source[correct_index], source[i]
          print("[[34]]")
          local source_copy = shallow_copy(source)
          for w = i, (correct_index - 1) do
            print(source[w], " ", source[w + 1])
            source[w + 1] = source_copy[w]
          end
          source[i] = correct_value
          print("234")
          for b = 1, #source do
            print(source[b])
          end
          -- Update the swaps
          -- table.insert(swaps, { i, correct_index })
          -- vim.cmd("BufferLineMoveNext")
          for t = 1, (correct_index - i) do
            print("3743534")
            vim.cmd("BufferLineCycleNext")
          end
          for r = 1, (correct_index - i) do
            vim.cmd("BufferLineMovePrev")
          end
          -- for p = 1, (correct_index - i) do
          --   print("3743534")
          -- end
          print("3456")
          print(i, " ", correct_index)
        end

        vim.cmd("BufferLineCycleNext")
      end

      return source, swaps
    end

    function GetElem()
      -- Get the buffer elements from bufferline
      local elements = require("bufferline").get_elements().elements

      if not elements or #elements == 0 then
        print("No buffers to save.")
        return
      end

      -- Prepare a table to store buffer information
      local buffer_info = {}
      for _, e in ipairs(elements) do
        -- Only save valid buffers (we save id and name for restoration)
        table.insert(buffer_info, { id = e.id, name = e.name })
      end

      -- Convert the table to JSON
      local jd = vim.fn.json_encode(buffer_info)

      local success2, json_data2 = pcall(vim.json.decode, jd)
      if not success2 then
        vim.notify("Failed to decode buffer info.", vim.log.levels.ERROR)
        return
      end
      -- Collect IDs from json_data2
      local json_data2_ids = {}
      for _, e in ipairs(json_data2) do
        table.insert(json_data2_ids, vim.api.nvim_buf_get_name(e.id))
        print(e.id)
      end

      jd = vim.fn.json_encode(json_data2_ids)
      return jd
    end

    function SaveBufferOrder()
      -- Save the buffer information to a file
      local json_data = GetElem()
      local filepath = vim.fn.stdpath("data") .. "/buffer_order.txt"
      vim.fn.writefile({ json_data }, filepath) -- Ensure it's wrapped in a list
      print("Buffer order saved to: " .. filepath)
    end

    vim.keymap.set("n", "<leader>bs", SaveBufferOrder, { desc = "Save Buffer Order" })
    vim.keymap.set("n", "<leader>br", lol, { desc = "Restore Buffer Order" })
    -- keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    -- keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Delay the function execution by 2 seconds
        vim.defer_fn(function()
          lol()
        end, 1) -- Delay in milliseconds
      end,
    })
  end,
}
