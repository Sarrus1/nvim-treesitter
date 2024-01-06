; Variables
(identifier) @variable

(global_variable) @variable.global

; Keywords
[
  "alias"
  "begin"
  "class"
  "do"
  "end"
  "ensure"
  "module"
  "rescue"
  "then"
] @keyword

[
  "return"
  "yield"
] @keyword.return

[
  "and"
  "or"
  "in"
  "not"
] @keyword.operator

[
  "def"
  "undef"
] @keyword.function

(method
  "end" @keyword.function)

[
  "case"
  "else"
  "elsif"
  "if"
  "unless"
  "when"
  "then"
] @keyword.conditional

(if
  "end" @keyword.conditional)

[
  "for"
  "until"
  "while"
  "break"
  "redo"
  "retry"
  "next"
] @keyword.repeat

(constant) @constant

((identifier) @type.qualifier
  (#any-of? @type.qualifier "private" "protected" "public"))

[
  "rescue"
  "ensure"
] @keyword.exception

((identifier) @keyword.exception
  (#any-of? @keyword.exception "fail" "raise"))

; Function calls
"defined?" @function

(call
  receiver: (constant)? @type
  method:
    [
      (identifier)
      (constant)
    ] @function.call)

(program
  (call
    (identifier) @keyword.import)
  (#any-of? @keyword.import "require" "require_relative" "load"))

; Function definitions
(alias
  (identifier) @function)

(setter
  (identifier) @function)

(method
  name:
    [
      (identifier) @function
      (constant) @type
    ])

(singleton_method
  name:
    [
      (identifier) @function
      (constant) @type
    ])

(class
  name: (constant) @type)

(module
  name: (constant) @type)

(superclass
  (constant) @type)

; Identifiers
[
  (class_variable)
  (instance_variable)
] @label

((identifier) @constant.builtin
  (#match? @constant.builtin "^__(callee|dir|id|method|send|ENCODING|FILE|LINE)__$"))

((constant) @type
  (#not-lua-match? @type "^[A-Z0-9_]+$"))

[
  (self)
  (super)
] @variable.builtin

(method_parameters
  (identifier) @variable.parameter)

(lambda_parameters
  (identifier) @variable.parameter)

(block_parameters
  (identifier) @variable.parameter)

(splat_parameter
  (identifier) @variable.parameter)

(hash_splat_parameter
  (identifier) @variable.parameter)

(optional_parameter
  (identifier) @variable.parameter)

(destructured_parameter
  (identifier) @variable.parameter)

(block_parameter
  (identifier) @variable.parameter)

(keyword_parameter
  (identifier) @variable.parameter)

; Literals
[
  (string)
  (bare_string)
  (subshell)
  (heredoc_body)
] @string

[
  (heredoc_beginning)
  (heredoc_end)
] @constant

[
  (bare_symbol)
  (simple_symbol)
  (delimited_symbol)
  (hash_key_symbol)
] @string.special.symbol

(pair
  key: (hash_key_symbol)
  ":" @constant)

(regex) @string.regexp

(escape_sequence) @string.escape

(integer) @number

(float) @number.float

[
  (true)
  (false)
] @boolean

(nil) @constant.builtin

(comment) @comment @spell

(program
  (comment)+ @comment.documentation
  (class))

(module
  (comment)+ @comment.documentation
  (body_statement
    (class)))

(class
  (comment)+ @comment.documentation
  (body_statement
    (method)))

(body_statement
  (comment)+ @comment.documentation
  (method))

; Operators
[
  "!"
  "="
  "=="
  "==="
  "<=>"
  "=>"
  "->"
  ">>"
  "<<"
  ">"
  "<"
  ">="
  "<="
  "**"
  "*"
  "/"
  "%"
  "+"
  "-"
  "&"
  "|"
  "^"
  "&&"
  "||"
  "||="
  "&&="
  "!="
  "%="
  "+="
  "-="
  "*="
  "/="
  "=~"
  "!~"
  "?"
  ":"
  ".."
  "..."
] @operator

[
  ","
  ";"
  "."
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "%w("
  "%i("
] @punctuation.bracket

(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special) @none
