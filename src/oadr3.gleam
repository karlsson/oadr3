import gleam/http/request
import gleam/string
import midas/task as t
import oadr3/operations
import oas/generator/utils
import snag

/// Skolverkets server hosting their open API services.
pub fn api_host() -> String {
  "api.skolverket.se"
}

pub fn handle_errors(response) {
  case response {
    Ok(response1) -> Ok(response1)
    Error(reason) ->
      snag.new(string.inspect(reason))
      |> snag.layer("failed to decode")
      |> Error
  }
}

/// Create the basic request url and accept header
fn base_request(_token) {
  request.new()
  |> request.set_host(api_host())
  |> utils.append_path("/skolenhetsregistret")
  |> request.prepend_header("accept", "application/json")
  |> request.set_body(<<>>)
}

// GENERATED -------------

pub fn delete_ven(token, ven_id) {
  let request = base_request(token)
  let request = operations.delete_ven_request(request, ven_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_ven_response(response)))
  t.done(data)
}

pub fn update_ven(token, ven_id, data) {
  let request = base_request(token)
  let request = operations.update_ven_request(request, ven_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_ven_response(response)))
  t.done(data)
}

pub fn search_ven_by_id(token, ven_id) {
  let request = base_request(token)
  let request = operations.search_ven_by_id_request(request, ven_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_ven_by_id_response(response)),
  )
  t.done(data)
}

pub fn create_ven(token, data) {
  let request = base_request(token)
  let request = operations.create_ven_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_ven_response(response)))
  t.done(data)
}

pub fn search_vens(
  token,
  ven_name ven_name,
  targets targets,
  skip skip,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.search_vens_request(request, ven_name, targets, skip, limit)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.search_vens_response(response)))
  t.done(data)
}

pub fn delete_subscription(token, subscription_id) {
  let request = base_request(token)
  let request = operations.delete_subscription_request(request, subscription_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_subscription_response(response)),
  )
  t.done(data)
}

pub fn update_subscription(token, subscription_id, data) {
  let request = base_request(token)
  let request =
    operations.update_subscription_request(request, subscription_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_subscription_response(response)),
  )
  t.done(data)
}

pub fn search_subscription_by_id(token, subscription_id) {
  let request = base_request(token)
  let request =
    operations.search_subscription_by_id_request(request, subscription_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_subscription_by_id_response(response)),
  )
  t.done(data)
}

pub fn create_subscription(token, data) {
  let request = base_request(token)
  let request = operations.create_subscription_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_subscription_response(response)),
  )
  t.done(data)
}

pub fn search_subscriptions(
  token,
  program_id program_id,
  client_name client_name,
  objects objects,
  skip skip,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.search_subscriptions_request(
      request,
      program_id,
      client_name,
      objects,
      skip,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_subscriptions_response(response)),
  )
  t.done(data)
}

pub fn delete_ven_resource(token, resource_id) {
  let request = base_request(token)
  let request = operations.delete_ven_resource_request(request, resource_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.delete_ven_resource_response(response)),
  )
  t.done(data)
}

pub fn update_ven_resource(token, resource_id, data) {
  let request = base_request(token)
  let request =
    operations.update_ven_resource_request(request, resource_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.update_ven_resource_response(response)),
  )
  t.done(data)
}

pub fn search_ven_resource_by_id(token, resource_id) {
  let request = base_request(token)
  let request =
    operations.search_ven_resource_by_id_request(request, resource_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_ven_resource_by_id_response(response)),
  )
  t.done(data)
}

pub fn create_resource(token, data) {
  let request = base_request(token)
  let request = operations.create_resource_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.create_resource_response(response)),
  )
  t.done(data)
}

pub fn search_ven_resources(
  token,
  resource_name resource_name,
  ven_id ven_id,
  targets targets,
  skip skip,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.search_ven_resources_request(
      request,
      resource_name,
      ven_id,
      targets,
      skip,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_ven_resources_response(response)),
  )
  t.done(data)
}

pub fn delete_report(token, report_id) {
  let request = base_request(token)
  let request = operations.delete_report_request(request, report_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_report_response(response)))
  t.done(data)
}

pub fn update_report(token, report_id, data) {
  let request = base_request(token)
  let request = operations.update_report_request(request, report_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_report_response(response)))
  t.done(data)
}

pub fn search_reports_by_report_id(token, report_id) {
  let request = base_request(token)
  let request =
    operations.search_reports_by_report_id_request(request, report_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_reports_by_report_id_response(response)),
  )
  t.done(data)
}

pub fn create_report(token, data) {
  let request = base_request(token)
  let request = operations.create_report_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_report_response(response)))
  t.done(data)
}

pub fn search_all_reports(
  token,
  program_id program_id,
  event_id event_id,
  client_name client_name,
  skip skip,
  limit limit,
) {
  let request = base_request(token)
  let request =
    operations.search_all_reports_request(
      request,
      program_id,
      event_id,
      client_name,
      skip,
      limit,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_all_reports_response(response)),
  )
  t.done(data)
}

pub fn delete_program(token, program_id) {
  let request = base_request(token)
  let request = operations.delete_program_request(request, program_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_program_response(response)))
  t.done(data)
}

pub fn update_program(token, program_id, data) {
  let request = base_request(token)
  let request = operations.update_program_request(request, program_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_program_response(response)))
  t.done(data)
}

pub fn search_program_by_program_id(token, program_id) {
  let request = base_request(token)
  let request =
    operations.search_program_by_program_id_request(request, program_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_program_by_program_id_response(response)),
  )
  t.done(data)
}

pub fn create_program(token, data) {
  let request = base_request(token)
  let request = operations.create_program_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_program_response(response)))
  t.done(data)
}

pub fn search_all_programs(token, targets targets, skip skip, limit limit) {
  let request = base_request(token)
  let request =
    operations.search_all_programs_request(request, targets, skip, limit)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_all_programs_response(response)),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_ven_resources(token, ven_id) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_ven_resources_request(
      request,
      ven_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.list_all_mqtt_notifier_topics_ven_resources_response(response),
    ),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_ven_programs(token, ven_id) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_ven_programs_request(
      request,
      ven_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.list_all_mqtt_notifier_topics_ven_programs_response(response),
    ),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_ven_events(token, ven_id) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_ven_events_request(request, ven_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_ven_events_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_ven(token, ven_id) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_ven_request(request, ven_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_ven_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_vens(token) {
  let request = base_request(token)
  let request = operations.list_all_mqtt_notifier_topics_vens_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_vens_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_subscriptions(token) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_subscriptions_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.list_all_mqtt_notifier_topics_subscriptions_response(response),
    ),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_resources(token) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_resources_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_resources_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_reports(token) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_reports_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_reports_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_program_events(token, program_id) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_program_events_request(
      request,
      program_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(
      operations.list_all_mqtt_notifier_topics_program_events_response(response),
    ),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_program(token, program_id) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_program_request(
      request,
      program_id,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_program_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_programs(token) {
  let request = base_request(token)
  let request =
    operations.list_all_mqtt_notifier_topics_programs_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_programs_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_mqtt_notifier_topics_events(token) {
  let request = base_request(token)
  let request = operations.list_all_mqtt_notifier_topics_events_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_mqtt_notifier_topics_events_response(
      response,
    )),
  )
  t.done(data)
}

pub fn list_all_notifiers(token) {
  let request = base_request(token)
  let request = operations.list_all_notifiers_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.list_all_notifiers_response(response)),
  )
  t.done(data)
}

pub fn delete_event(token, event_id) {
  let request = base_request(token)
  let request = operations.delete_event_request(request, event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.delete_event_response(response)))
  t.done(data)
}

pub fn update_event(token, event_id, data) {
  let request = base_request(token)
  let request = operations.update_event_request(request, event_id, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.update_event_response(response)))
  t.done(data)
}

pub fn search_events_by_id(token, event_id) {
  let request = base_request(token)
  let request = operations.search_events_by_id_request(request, event_id)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_events_by_id_response(response)),
  )
  t.done(data)
}

pub fn create_event(token, data) {
  let request = base_request(token)
  let request = operations.create_event_request(request, data)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.create_event_response(response)))
  t.done(data)
}

pub fn search_all_events(
  token,
  program_id program_id,
  targets targets,
  skip skip,
  limit limit,
  active active,
) {
  let request = base_request(token)
  let request =
    operations.search_all_events_request(
      request,
      program_id,
      targets,
      skip,
      limit,
      active,
    )
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.search_all_events_response(response)),
  )
  t.done(data)
}

pub fn fetch_token(token) {
  let request = base_request(token)
  let request = operations.fetch_token_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(handle_errors(operations.fetch_token_response(response)))
  t.done(data)
}

pub fn get_auth_server_info(token) {
  let request = base_request(token)
  let request = operations.get_auth_server_info_request(request)
  use response <- t.do(t.fetch(request))
  use data <- t.try(
    handle_errors(operations.get_auth_server_info_response(response)),
  )
  t.done(data)
}
