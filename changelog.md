# Changelog

## v2.0.0-next.1

### What's new

- Add proper support for `StatusLineTerm` & `StatusLineTermNC`, controlled via `enable.terminal`
- Add background glow to diagnostic virtual text
- Add `extend_background_behind_borders`
- Add `styles.bold` and alternatively styling when disabled
- Add `before_highlight` hook to allow changing palette values and behaviours
- Increase contrast of search, visual selections, and more

### Features

**extend_background_behind_borders**

Extend float backgrounds behind borders. Results vary depending on your border characters.

```lua
{
    extend_background_behind_borders = true
}
```

**styles.transparency**

Enable a unique experience focused around transparent terminals, avoiding large backgrounds and differentiating selections with foreground colours when possible.

```lua
{
    styles = {
        transparency = true
    }
}
```

**before_highlight**

```lua
{
    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        if highlight.undercurl then
            highlight.undercurl = false
        end

        -- Change palette colour
        if highlight.fg == palette.pine then
            highlight.fg = palette.foam
        end
    end,
}
```

### Breaking changes

> [!WARNING]
> Removed or renamed options should continue to work via internal migrations but backwards compatibility is not tested and may break at any time.

```diff
- dim_nc_background = true,
+ dim_inactive_windows = true,

- disable_background = true,
- disable_float_background = true,
+ styles.transparency = true

- disable_italics = true,
+ styles.italic = false,

- groups = {
-   background = "...",
-   comment = "...",
-   punctuation = "...",
- },
+ highlight_groups = {
+   Normal = { bg = "..." },
+   Comment = { fg = "..." },
+   ["@punctuation"] = { fg = "..." },
+ }
```
