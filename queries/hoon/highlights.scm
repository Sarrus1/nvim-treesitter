(number) @number

(string) @string

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  (coreTerminator)
  (seriesTerminator)
] @punctuation.delimiter

(rune) @operator

(term) @constant

(aura) @constant.builtin

(Gap) @comment

(boolean) @constant.builtin

(date) @string.special

(mold) @string.special.symbol

(specialIndex) @number.builtin

(lark) @operator

(fullContext) @string.special.symbol
