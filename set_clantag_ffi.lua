ffi.cdef[[
    typedef int(__fastcall* clantag_t)(const char*, const char*);
]]

local fn_change_clantag = Utils.PatternScan("engine.dll", "53 56 57 8B DA 8B F9 FF 15")
print(tostring(fn_change_clantag))
local set_clantag = ffi.cast("clantag_t", fn_change_clantag)
set_clantag("asd", "asd")
