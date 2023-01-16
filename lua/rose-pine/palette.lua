local variants = {
	main = {
		base = '#191724',
		surface = '#1f1d2e',
		overlay = '#26233a',
		muted = '#6e6a86',
		subtle = '#908caa',
		text = '#e0def4',
		love = '#eb6f92',
		gold = '#f6c177',
		rose = '#ebbcba',
		pine = '#31748f',
		foam = '#9ccfd8',
		iris = '#c4a7e7',
		highlight_low = '#21202e',
		highlight_med = '#403d52',
		highlight_high = '#524f67',
		none = 'NONE',
	},
	moon = {
		base = '#232136',
		surface = '#2a273f',
		overlay = '#393552',
		muted = '#6e6a86',
		subtle = '#908caa',
		text = '#e0def4',
		love = '#eb6f92',
		gold = '#f6c177',
		rose = '#ea9a97',
		pine = '#3e8fb0',
		foam = '#9ccfd8',
		iris = '#c4a7e7',
		highlight_low = '#2a283e',
		highlight_med = '#44415a',
		highlight_high = '#56526e',
		none = 'NONE',
	},
	dawn = {
		base = '#faf4ed',
		surface = '#fffaf3',
		overlay = '#f2e9e1',
		muted = '#9893a5',
		subtle = '#797593',
		text = '#575279',
		love = '#b4637a',
		gold = '#ea9d34',
		rose = '#d7827e',
		pine = '#286983',
		foam = '#56949f',
		-- pine = '#286983',
		-- pine = '#008080',
		pine = '#35A34A',
		-- pine = '#689d6a',
		-- pine = '#397a94',
		-- pine = '#599ab4',
		-- pine = '#397a94',
		-- pine = '#84ae6c',
		-- pine = '#93C572',
		-- pine = '#478778',
		-- pine = '#B4C424',
		-- pine = '#478778',
		-- pine = '#3c90c6',
		-- pine = '#40826D',
		-- pine = '#008080',
		-- pine = '#40B5AD',
		-- pine = '#8A9A5B',
		-- pine = '#00af87',
		-- pine = '#5F9EA0',
		-- pine = '#BAEDA9',
		-- pine = '#90EE90',
		-- pine = '#40826D',
		-- pine = '#9FE2BF',
		-- pine = '#598341',
		-- pine = '#6c9654',
		-- pine = '#7aa462',
		-- pine = '#83ad6b',
		-- pine = '#88b270',
		-- pine = '#91bb79',
		iris = '#907aa9',
		highlight_low = '#f4ede8',
		highlight_med = '#dfdad9',
		highlight_high = '#cecacd',
		none = 'NONE',
	},
}

local palette = {}

if vim.o.background == 'light' then
	palette = variants.dawn
else
	palette = variants[(vim.g.rose_pine_variant == 'moon' and 'moon') or 'main']
end

return palette
