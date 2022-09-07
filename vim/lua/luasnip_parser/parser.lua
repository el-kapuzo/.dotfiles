Parser = {}
local TokenType = {
    Snippet = 1,
    PostFixSnippet = 2,
    EndSnippet = 3,
    StartLua = 4,
    EndLua = 5,
    Text = 6,
    Eof = 7,
}

function Parser:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.tokens = {}
    self.last_consumed = nil
    self.lines = nil
    self.current_line = 0
    return o
end

function Parser:parse(lines)
    self.lines = lines
    table.insert(self.tokens, {tokenType=TokenType.Eof, lex=nil})
    return self.tokens
end

function Parser:parse_line()
end

