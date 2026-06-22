# oadr3

[![Package Version](https://img.shields.io/hexpm/v/oadr3)](https://hex.pm/packages/oadr3)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/oadr3/)


```sh
gleam add oadr3
```

Further documentation can be found at <https://hexdocs.pm/oadr3>.


## What this is
An attempt to parse the [OpenADR 3 API](https://github.com/grid-coordination/openadr3-specification/blob/main/3.1.0/openadr3.yaml) spec. to Gleam using the [OAS](https://oas.hexdocs.pm/) decoder and [generator](https://oas-generator.hexdocs.pm/).
### Example of usage:
Collect program information on California electricity prices from the [Grid Coordination](https://github.com/grid-coordination/price-server-user-guide) price server.
```gleam
import gleam/http
import gleam/http/request
import gleam/json
import gleam/option.{None, Some}
import midas/effect as e
import oadr3
import oadr3/runner

pub fn main() {
  let assert e.Done(Ok(Ok(programs))) =
    runner.run(oadr3.search_all_programs(
      base_request(None),
      targets: None,
      skip: None,
      limit: Some(10),
    ))
  let assert [program1, ..] = programs
  let #(object_meta_data, program_request) = program1
  echo program_request.payload_descriptors
  echo program_request.program_name
  echo object_meta_data.id

  let assert e.Done(Ok(Ok(events))) =
    runner.run(oadr3.search_all_events(
      base_request(None),
      Some(object_meta_data.id),
      None,
      None,
      Some(1),
      None,
    ))
  echo events
}

/// Create the basic request url and accept header
fn base_request(_token: a) -> request.Request(BitArray) {
  request.new()
  |> request.set_host("price.grid-coordination.energy")
  |> request.set_scheme(http.Https)
  |> request.set_path("/openadr3/3.1.0")
  |> request.set_body(<<>>)
}
```

## Development
The `gen_oadr3.gleam` module is located in the `dev` directory when cloned from the github repository.

To generate new oas schema and operations from `openadr3.yaml` specification:
```sh
gleam run -m gen_oadr3 
```