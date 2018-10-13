"""
The ticker is a high level overview of the state of the market.
It shows you the current best bid and ask, as well as the last
trade price. It also includes information such as daily volume
and how much the price has moved over the last day.
"""
function ticker(symbol::SymStr)
    r = get("$URL/pubticker/$symbol")
    s = String(r.body)
    return json2df(s)
end

"""
Various statistics about the requested pair.
"""
function stats(symbol::SymStr)
    r = get("$URL/stats/$symbol")
    s = String(r.body)
    return json2df(s)
end

"""
Full margin funding book.
"""
function funding_book(currency::SymStr,
                      limit_bids::Int64 = 50,
                      limit_asks::Int64 = 50)
    r = get("$URL/lendbook/$currency?limit_bids=$limit_bids&limit_asks=$limit_asks")
    s = String(r.body)
    return json2df(s)
end

"""
Full order book.
"""
function order_book(symbol::SymStr,
                    limit_bids::Int64 = 50,
                    limit_asks::Int64 = 50,
                    group::Bool = true)
    r = get("$URL/book/$symbol?limit_bids=$limit_bids&limit_asks=$limit_asks")
    s = String(r.body)
    return json2df(s)
end

"""
List of the most recent trades for the given symbol.
"""
function trades(symbol::SymStr,
                limit_trades::Int64 = 50)
    r = get("$URL/trades/$symbol?limit_trades=$limit_trades")
    s = String(r.body)
    return json2df(s)
end

"""
List of the most recent funding data for the given currency: total
amount provided and Flash Return Rate (in % by 365 days) over time.
"""
function lends(currency::SymStr,
               limit_lends::Int64 = 50)
    r = get("$URL/lends/$currency?limit_lends=$limit_lends")
    s = String(r.body)
    return json2df(s)
end

"""
List of symbol names.
"""
function symbols()
    r = get("$URL/symbols")
    s = String(r.body)
    return json2df(s)
end

"""
List of valid symbol IDs and the pair details.
"""
function symbol_details()
    r = get("$URL/symbols_details")
    s = String(r.body)
    return json2df(s)
end
