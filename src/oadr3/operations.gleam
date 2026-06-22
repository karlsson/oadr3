import gleam/bool
import gleam/dynamic/decode
import gleam/http
import gleam/http/response
import gleam/int
import gleam/json
import gleam/option
import gleam/result
import oadr3/schema
import oadr3/utils

pub fn delete_ven_request(base, ven_id) {
  let method = http.Delete
  let path = "/vens/" <> ven_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_ven_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.ven_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_ven_request(base, ven_id, data) {
  let method = http.Put
  let path = "/vens/" <> ven_id
  let query = []
  let body = utils.json_to_bits(schema.ven_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_ven_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.ven_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_ven_by_id_request(base, ven_id) {
  let method = http.Get
  let path = "/vens/" <> ven_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_ven_by_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.ven_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_ven_request(base, data) {
  let method = http.Post
  let path = "/vens"
  let query = []
  let body = utils.json_to_bits(schema.ven_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_ven_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.ven_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_vens_request(
  base,
  ven_name ven_name,
  targets targets,
  skip skip,
  limit limit,
) {
  let method = http.Get
  let path = "/vens"
  let query = [
    #("ven_name", ven_name),
    #(
      "targets",
      option.map(targets, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("skip", option.map(skip, int.to_string)),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_vens_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.ven_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_subscription_request(base, subscription_id) {
  let method = http.Delete
  let path = "/subscriptions/" <> subscription_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_subscription_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.subscription_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_subscription_request(base, subscription_id, data) {
  let method = http.Put
  let path = "/subscriptions/" <> subscription_id
  let query = []
  let body = utils.json_to_bits(schema.subscription_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_subscription_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.subscription_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_subscription_by_id_request(base, subscription_id) {
  let method = http.Get
  let path = "/subscriptions/" <> subscription_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_subscription_by_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.subscription_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_subscription_request(base, data) {
  let method = http.Post
  let path = "/subscriptions"
  let query = []
  let body = utils.json_to_bits(schema.subscription_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_subscription_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 ->
      json.parse_bits(body, schema.subscription_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_subscriptions_request(
  base,
  program_id program_id,
  client_name client_name,
  objects objects,
  skip skip,
  limit limit,
) {
  let method = http.Get
  let path = "/subscriptions"
  let query = [
    #("program_id", program_id),
    #("client_name", client_name),
    #(
      "objects",
      option.map(objects, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("skip", option.map(skip, int.to_string)),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_subscriptions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.subscription_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_ven_resource_request(base, resource_id) {
  let method = http.Delete
  let path = "/resources/" <> resource_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_ven_resource_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.resource_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_ven_resource_request(base, resource_id, data) {
  let method = http.Put
  let path = "/resources/" <> resource_id
  let query = []
  let body = utils.json_to_bits(schema.resource_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_ven_resource_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.resource_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_ven_resource_by_id_request(base, resource_id) {
  let method = http.Get
  let path = "/resources/" <> resource_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_ven_resource_by_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.resource_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_resource_request(base, data) {
  let method = http.Post
  let path = "/resources"
  let query = []
  let body = utils.json_to_bits(schema.resource_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_resource_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.resource_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_ven_resources_request(
  base,
  resource_name resource_name,
  ven_id ven_id,
  targets targets,
  skip skip,
  limit limit,
) {
  let method = http.Get
  let path = "/resources"
  let query = [
    #("resource_name", resource_name),
    #("ven_id", ven_id),
    #(
      "targets",
      option.map(targets, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("skip", option.map(skip, int.to_string)),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_ven_resources_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.resource_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_report_request(base, report_id) {
  let method = http.Delete
  let path = "/reports/" <> report_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_report_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.report_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_report_request(base, report_id, data) {
  let method = http.Put
  let path = "/reports/" <> report_id
  let query = []
  let body = utils.json_to_bits(schema.report_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_report_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.report_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_reports_by_report_id_request(base, report_id) {
  let method = http.Get
  let path = "/reports/" <> report_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_reports_by_report_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.report_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_report_request(base, data) {
  let method = http.Post
  let path = "/reports"
  let query = []
  let body = utils.json_to_bits(schema.report_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_report_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.report_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_all_reports_request(
  base,
  program_id program_id,
  event_id event_id,
  client_name client_name,
  skip skip,
  limit limit,
) {
  let method = http.Get
  let path = "/reports"
  let query = [
    #("program_id", program_id),
    #("event_id", event_id),
    #("client_name", client_name),
    #("skip", option.map(skip, int.to_string)),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_all_reports_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.report_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_program_request(base, program_id) {
  let method = http.Delete
  let path = "/programs/" <> program_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_program_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.program_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_program_request(base, program_id, data) {
  let method = http.Put
  let path = "/programs/" <> program_id
  let query = []
  let body = utils.json_to_bits(schema.program_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_program_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.program_decoder()) |> result.map(Ok)
    _ -> json.parse_bits(body, schema.problem_decoder()) |> result.map(Error)
  }
}

pub fn search_program_by_program_id_request(base, program_id) {
  let method = http.Get
  let path = "/programs/" <> program_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_program_by_program_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.program_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_program_request(base, data) {
  let method = http.Post
  let path = "/programs"
  let query = []
  let body = utils.json_to_bits(schema.program_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_program_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.program_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_all_programs_request(
  base,
  targets targets,
  skip skip,
  limit limit,
) {
  let method = http.Get
  let path = "/programs"
  let query = [
    #(
      "targets",
      option.map(targets, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("skip", option.map(skip, int.to_string)),
    #("limit", option.map(limit, int.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_all_programs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.program_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_ven_resources_request(base, ven_id) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/vens/" <> ven_id <> "/resources"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_ven_resources_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_ven_programs_request(base, ven_id) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/vens/" <> ven_id <> "/programs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_ven_programs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_ven_events_request(base, ven_id) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/vens/" <> ven_id <> "/events"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_ven_events_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_ven_request(base, ven_id) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/vens/" <> ven_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_ven_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_vens_request(base) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/vens"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_vens_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_subscriptions_request(base) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/subscriptions"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_subscriptions_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_resources_request(base) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/resources"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_resources_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_reports_request(base) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/reports"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_reports_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_program_events_request(base, program_id) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/programs/" <> program_id <> "/events"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_program_events_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_program_request(base, program_id) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/programs/" <> program_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_program_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_programs_request(base) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/programs"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_programs_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_mqtt_notifier_topics_events_request(base) {
  let method = http.Get
  let path = "/notifiers/mqtt/topics/events"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_mqtt_notifier_topics_events_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifier_topics_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn list_all_notifiers_request(base) {
  let method = http.Get
  let path = "/notifiers"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn list_all_notifiers_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.notifiers_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn delete_event_request(base, event_id) {
  let method = http.Delete
  let path = "/events/" <> event_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn delete_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn update_event_request(base, event_id, data) {
  let method = http.Put
  let path = "/events/" <> event_id
  let query = []
  let body = utils.json_to_bits(schema.event_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn update_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_events_by_id_request(base, event_id) {
  let method = http.Get
  let path = "/events/" <> event_id
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_events_by_id_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 -> json.parse_bits(body, schema.event_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn create_event_request(base, data) {
  let method = http.Post
  let path = "/events"
  let query = []
  let body = utils.json_to_bits(schema.event_request_encode(data))
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
  |> utils.set_body("application/json", body)
}

pub fn create_event_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    201 -> json.parse_bits(body, schema.event_decoder()) |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn search_all_events_request(
  base,
  program_id program_id,
  targets targets,
  skip skip,
  limit limit,
  active active,
) {
  let method = http.Get
  let path = "/events"
  let query = [
    #("program_id", program_id),
    #(
      "targets",
      option.map(targets, fn(_) { panic as "query parameter is not supported" }),
    ),
    #("skip", option.map(skip, int.to_string)),
    #("limit", option.map(limit, int.to_string)),
    #("active", option.map(active, bool.to_string)),
  ]
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn search_all_events_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, decode.list(schema.event_decoder()))
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn fetch_token_request(base) {
  let method = http.Post
  let path = "/auth/token"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn fetch_token_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.client_credential_response_decoder())
      |> result.map(Ok)
    _ -> response |> Error |> Ok
  }
}

pub fn get_auth_server_info_request(base) {
  let method = http.Get
  let path = "/auth/server"
  let query = []
  base
  |> utils.set_method(method)
  |> utils.append_path(path)
  |> utils.set_query(query)
}

pub fn get_auth_server_info_response(response) {
  let response.Response(status:, body:, ..) = response
  case status {
    200 ->
      json.parse_bits(body, schema.auth_server_info_decoder())
      |> result.map(Ok)
    _ -> json.parse_bits(body, schema.problem_decoder()) |> result.map(Error)
  }
}
