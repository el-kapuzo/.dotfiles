Scanner = {}

local TokenType = {
    Snippet = 1,
    PostFixSnippet = 2,
    EndSnippet = 3,
    StartLua = 4,
    EndLua = 5,
    Text = 6,
    Eof = 7,
}

function Scanner:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.tokens = {}
    self.lines = nil
    self.source = nil
    self.current_line = 0
    self.current = 0
    self.start = 0
    return o
end

function Scanner:parse(lines)
    self.lines = lines
    table.insert(self.tokens, {tokenType=TokenType.Eof, lex=nil})
    return self.tokens
end


