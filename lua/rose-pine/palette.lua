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
		opacity = 0.1,
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
		opacity = 0.1,
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
		iris = '#907aa9',
		highlight_low = '#f4ede8',
		highlight_med = '#dfdad9',
		highlight_high = '#cecacd',
		opacity = 0.05,
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
