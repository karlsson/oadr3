import castor
import castor/decodex
import gleam/io
import gleam/json
import gleam/string
import oas
import simplifile
import taffy

pub fn main() {
  let assert Ok(yamlstring) = read_yaml()
  case taffy.parse(yamlstring) {
    Ok(yamlvalue) -> {
      let assert Ok(yamlvalue) = taffy.validate_unique_keys(yamlvalue)
      // simplifile.write("priv/openadr3.json", taffy.to_json_string(yamlvalue))
      let result = json.parse(taffy.to_json_string(yamlvalue), castor.decoder())
      // let result = json.parse(taffy.to_json_string(yamlvalue), oas.decoder())
      case result {
        Ok(_schema) -> {
          io.println("Manage to decode with castor.decoder()")
        }
        // Ok(oas.Document(paths: paths, components: components, ..)) -> {
        //   io.println("Manage to decode with oas.decoder()")
        // }
        Error(e) -> {
          echo e
          Nil
        }
      }
    }
    Error(e) -> {
      echo e
      Nil
    }
  }
}

import gleam/bit_array
import gleam/http
import gleam/http/request
import gleam/http/response
import gleam/httpc

fn read_yaml() {
  let filename = "priv/openadr3.yaml"
  case simplifile.read(from: filename) {
    Ok(yamlstring) -> Ok(yamlstring)
    Error(_) ->
      case get_yaml() {
        Ok(yamlstring) -> {
          let assert Ok(Nil) = simplifile.write(filename, yamlstring)
          Ok(yamlstring)
        }
        Error(Nil) -> Error(Nil)
      }
  }
}

fn get_yaml() -> Result(String, Nil) {
  let request =
    request.new()
    |> request.set_host("raw.githubusercontent.com")
    |> request.set_scheme(http.Https)
    |> request.set_path(
      "/grid-coordination/openadr3-specification/refs/heads/main/3.1.0/openadr3.yaml",
    )
    |> request.prepend_header("accept", "text/plain")
    |> request.set_body(<<>>)
    |> request.set_method(http.Get)

  case httpc.send_bits(request) {
    Ok(response.Response(200, body:, ..)) -> bit_array.to_string(body)
    _ -> Error(Nil)
  }
}
