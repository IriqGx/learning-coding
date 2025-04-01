for i, v in ipairs({1, 2, nil, 4}) do
    print(i, v)
end
-- ipairs return an iterator function, the table, and a starting index
-- ipairs also stop at the first nil in the table

function ipairs(t)
    local function iterator(t, i)
        i = i + 1
        local v = t[i]
        if v ~= nil then
            return i, v
        end
    end
    return iterator, t, 0
end