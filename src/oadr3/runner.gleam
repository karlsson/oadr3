//// Utility functions for running midas tasks

import gleam/http/response.{type Response}
import gleam/httpc
import gleam/string
import midas/effect as e
import snag

pub fn handle_errors(response) {
  case response {
    Ok(response1) -> Ok(response1)
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode")
      |> Error
  }
}

/// Will return e.Done upon success
pub fn run(effect: e.Effect(a, b)) -> e.Effect(a, b) {
  case effect {
    e.Fetch(request, resume) ->
      run(resume(map_http_response(httpc.send_bits(request))))
    any -> any
    //   t.abort(string.inspect(any) <> " - This effect is not handled in this environment")
  }
}

fn map_http_response(
  response: Result(Response(BitArray), httpc.HttpError),
) -> Result(Response(BitArray), e.FetchError) {
  case response {
    Ok(response) -> Ok(response)
    Error(httpc.InvalidUtf8Response) -> Error(e.UnableToReadBody)
    Error(httpc.FailedToConnect(..)) ->
      Error(e.NetworkError("Failed to connect"))
    Error(httpc.ResponseTimeout) -> Error(e.NetworkError("Connect timed out"))
  }
}
