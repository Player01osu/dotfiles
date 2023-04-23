local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local parse_snippet = require("luasnip.util.parser").parse_snippet

ls.add_snippets("Nanki", {
	s("b", {
		t("<b>"),
		i(1, ""),
		t("</b>"),
	}),
	s("t", {
		t([[<span style="color: rgb(151, 219, 255)">]]),
		i(1, ""),
		t([[</span>]]),
	}),
	s("cloze", {
		t("{{c"),
		i(1, "n"),
		t("::"),
		i(2, "blank"),
		t("}}"),
	}),
	s("cl", {
		t("{{c"),
		i(1, "n"),
		t("::"),
		i(2, "blank"),
		t("}}"),
	}),
	s("cld", {
		t("{{c"),
		i(1, "n"),
		t("::"),
		i(2, "blank"),
		t("::"),
		i(3, "clue"),
		t("}}"),
	}),
	s("lhr", {
		t("Location and Hormone/Response of "),
		i(1, "gland"),
		t("; "),
		t("Located in "),
		i(2, "location"),
		t(". "),
		t("Hormone and responses are "),
		i(3, "hormone and responses"),
	}),
})

ls.add_snippets("javascript", {
	s("onEvent", {
		t('onEvent("'),
		i(1, "id"),
		t('", "'),
		i(2, "event"),
		t('", function() {'),
		i(3, "code"),
		t("});"),
	}),
})

ls.add_snippets("kalker", {
	s("t", {
		t('θ')
	}),
	s("pi", {
		t('π'),
	}),
	s("deg", {
		t('°'),
	}),
	s("sqrt", {
		t('√('),
		i(1),
		t(')')
	}),
	s("int", {
		t('∫('),
		i(1, "lower bound"),
		t(','),
		i(2, "upper bound"),
		t(','),
		i(3, "expression"),
		t(','),
		i(4, "with respect to"),
		t(')'),
	}),
	s("frac", {
		t('('), i(1, "top"), t(')'),
		t('/'),
		t('('), i(2, "bottom"), t(')')
	}),
})


ls.add_snippets("norg", {
	s("f", {
		t('{:'), i(1, "path"), t(':}'),
	}),
})

ls.add_snippets("latex", {
	s("f", {
		t('\\frac{'), i(1), t('}'), t('{'), i(2), t('}')
	}),
	s("sqrt", {
		t('\\sqrt{'), i(1), t('}')
	}),
	s("^", {
		t('^{'), i(1), t('}')
	}),
	s("_", {
		t('_{'), i(1), t('}')
	}),
})

ls.add_snippets("tex", {
	s("f", {
		t('\\frac{'), i(1), t('}'), t('{'), i(2), t('}')
	}),
	s("sqrt", {
		t('\\sqrt{'), i(1), t('}')
	}),
	s("^", {
		t('^{'), i(1), t('}')
	}),
	s("_", {
		t('_{'), i(1), t('}')
	}),
})
