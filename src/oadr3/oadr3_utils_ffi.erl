-module(oadr3_utils_ffi).
-export([merge/1]).

-spec merge(JsonList :: [iodata()]) -> iodata().
merge(JsonList) ->
    Map =
    lists:foldl(
        fun(Json , Acc)->
            A = iolist_to_binary(Json),
            maps:merge(
                case json:decode(A) of
                    M when is_map(M) -> M;
                    _ -> #{}
                end,
                Acc)
        end,
        #{},
        JsonList
    ),
    json:encode(Map).
