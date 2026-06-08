# oadr3
<!-- 
[![Package Version](https://img.shields.io/hexpm/v/oadr3)](https://hex.pm/packages/oadr3)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/oadr3/)


```sh
gleam add oadr3
```
```gleam
import oadr3

pub fn main() -> Nil {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/oadr3>.
-->
## What this is
An attempt to parse the [OpenADR 3 API](https://github.com/grid-coordination/openadr3-specification/blob/main/3.1.0/openadr3.yaml) spec. to Gleam using the [OAS](https://oas.hexdocs.pm/) decoder.
## Development

```sh
gleam run -m gen_oadr3 # Generate oas spec.
```