module DebugHelpers
export @into_global_scope

"""

    @into_scope(d::AbstractDict{Symbol})

Turns each `key,val` pair in `d` into a variable assignment.
"""
macro into_scope(d)
    d = __module__.eval(d)
    ret = quote end
    for (key, val) in pairs(d)
        if !(key isa Symbol)
            msg = """Keys should be symbols. Got:
            typeof(key) = $(typeof(key))
            key = $key
            """
            error(msg)
        end
        push!(ret.args, :($(esc(key)) = $val))
    end
    ret
end

end
