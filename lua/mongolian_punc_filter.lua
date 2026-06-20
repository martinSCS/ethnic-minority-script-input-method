local function filter(input,env)
    local char_comment = {
        [utf8.char(0x180b)] = "FVS1",
        [utf8.char(0x180c)] = "FVS2",
        [utf8.char(0x180d)] = "FVS3",
        [utf8.char(0x180d)] = "FVS3",
        [utf8.char(0x180f)] = "FVS4",
        [utf8.char(0x180e)] = "MVS",
        [utf8.char(0x200c)] = "ZWNJ",
        [utf8.char(0x200d)] = "ZWJ",
        [utf8.char(0x202f)] = "NNBSP"
    }
    for cand in input:iter() do
        if char_comment[cand.text] ~= nil then
            cand.comment = char_comment[cand.text]
        end
        yield(cand)
    end
end

return filter
