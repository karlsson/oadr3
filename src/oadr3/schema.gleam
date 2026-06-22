import gleam/dynamic/decode
import gleam/json
import gleam/option.{type Option, None}
import oadr3/utils

pub type VenResourceRequest {
  VenResourceRequest(
    attributes: Option(List(ValuesMap)),
    object_type: String,
    resource_name: ResourceName,
    ven_id: ObjectId,
  )
}

pub type MqttNotifierAuthenticationCertificate {
  MqttNotifierAuthenticationCertificate(
    ca_cert: String,
    client_cert: String,
    client_key: String,
    method_: String,
  )
}

pub type VenVenRequest {
  VenVenRequest(
    attributes: Option(List(ValuesMap)),
    object_type: String,
    ven_name: VenName,
  )
}

pub type ObjectMetadata {
  ObjectMetadata(
    created_date_time: DateTime,
    id: ObjectId,
    modification_date_time: DateTime,
    object_type: ObjectTypes,
  )
}

pub type IntervalPeriod {
  IntervalPeriod(
    duration: Option(Duration),
    randomize_start: Option(Duration),
    start: Option(DateTime),
  )
}

pub type NotifierOperationsTopics {
  NotifierOperationsTopics(
    all: Option(String),
    create: Option(String),
    delete: String,
    update: String,
  )
}

pub type ProgramRequest {
  ProgramRequest(
    attributes: Option(List(ValuesMap)),
    interval_period: Option(IntervalPeriod),
    payload_descriptors: Option(List(utils.Any)),
    program_descriptions: Option(List(Anon25ddbf1f)),
    program_name: String,
    targets: Option(List(Target)),
  )
}

pub type BlResourceRequest {
  BlResourceRequest(
    attributes: Option(List(ValuesMap)),
    client_id: ClientId,
    object_type: String,
    resource_name: ResourceName,
    targets: Option(List(Target)),
    ven_id: ObjectId,
  )
}

pub type Problem {
  Problem(
    detail: Option(String),
    instance: Option(String),
    status: Option(Int),
    title: Option(String),
    type_: Option(String),
  )
}

pub type ReportPayloadDescriptor {
  ReportPayloadDescriptor(
    accuracy: Option(Float),
    confidence: Option(Int),
    object_type: String,
    payload_type: String,
    reading_type: Option(ReadingType),
    units: Option(Units),
  )
}

pub type ReportRequest {
  ReportRequest(
    client_name: ClientName,
    event_id: ObjectId,
    payload_descriptors: Option(List(ReportPayloadDescriptor)),
    report_name: Option(String),
    resources: List(Anon818bb683),
  )
}

pub type AuthError {
  AuthError(
    error: String,
    error_description: Option(String),
    error_uri: Option(String),
  )
}

pub type MqttNotifierAuthenticationOauth2BearerToken {
  MqttNotifierAuthenticationOauth2BearerToken(method_: String, username: String)
}

pub type BlVenRequest {
  BlVenRequest(
    attributes: Option(List(ValuesMap)),
    client_id: ClientId,
    object_type: String,
    targets: Option(List(Target)),
    ven_name: VenName,
  )
}

pub type ReportDescriptor {
  ReportDescriptor(
    aggregate: Option(Bool),
    frequency: Option(Int),
    historical: Option(Bool),
    num_intervals: Option(Int),
    payload_type: String,
    reading_type: Option(ReadingType),
    repeat: Option(Int),
    report_intervals: Option(String),
    start_interval: Option(Int),
    targets: Option(List(Target)),
    units: Option(Units),
  )
}

pub type Point {
  Point(x: Float, y: Float)
}

pub type ClientCredentialRequest {
  ClientCredentialRequest(
    client_id: String,
    client_secret: String,
    grant_type: String,
    scope: Option(String),
  )
}

pub type Notification {
  Notification(
    object: Nil,
    object_type: ObjectTypes,
    operation: String,
    targets: Option(List(Target)),
  )
}

pub type SubscriptionRequest {
  SubscriptionRequest(
    client_name: ClientName,
    object_operations: List(Anon85c77f13),
    program_id: Option(ObjectId),
    targets: Option(List(Target)),
  )
}

pub type ValuesMap {
  ValuesMap(type_: String, values: List(utils.Any))
}

pub type NotifiersResponse {
  NotifiersResponse(mqtt: Option(MqttNotifierBindingObject), webhook: Bool)
}

pub type MqttNotifierAuthenticationAnonymous {
  MqttNotifierAuthenticationAnonymous(method_: String)
}

pub type EventPayloadDescriptor {
  EventPayloadDescriptor(
    currency: Option(String),
    object_type: String,
    payload_type: String,
    units: Option(Units),
  )
}

pub type EventRequest {
  EventRequest(
    duration: Option(Duration),
    event_name: Option(String),
    interval_period: Option(IntervalPeriod),
    intervals: Option(List(Interval)),
    payload_descriptors: Option(List(EventPayloadDescriptor)),
    priority: Option(Int),
    program_id: ObjectId,
    report_descriptors: Option(List(ReportDescriptor)),
    targets: Option(List(Target)),
  )
}

pub type MqttNotifierBindingObject {
  MqttNotifierBindingObject(
    uris: List(String),
    authentication: utils.Any,
    serialization: String,
  )
}

pub type NotifierTopicsResponse {
  NotifierTopicsResponse(topics: NotifierOperationsTopics)
}

pub type Interval {
  Interval(
    id: Int,
    interval_period: Option(IntervalPeriod),
    payloads: List(ValuesMap),
  )
}

pub type AuthServerInfo {
  AuthServerInfo(token_url: String)
}

pub type ClientCredentialResponse {
  ClientCredentialResponse(
    access_token: String,
    expires_in: Option(Int),
    refresh_token: Option(String),
    scope: Option(String),
    token_type: String,
  )
}

pub type Anon25ddbf1f {
  Anon25ddbf1f(url: String)
}

pub type Anon818bb683 {
  Anon818bb683(
    interval_period: Option(IntervalPeriod),
    intervals: List(Interval),
    resource_name: ResourceName,
  )
}

pub type Anon85c77f13 {
  Anon85c77f13(
    bearer_token: Option(String),
    callback_url: String,
    objects: List(ObjectTypes),
    operations: List(String),
  )
}

pub type Anon97535fea {
  Anon97535fea(client_id: ClientId)
}

pub type Resource =
  #(ObjectMetadata, BlResourceRequest)

pub type VenRequest =
  utils.Any

pub type Event =
  #(ObjectMetadata, EventRequest)

pub type VenName =
  String

pub type Duration =
  String

pub type ClientId =
  String

pub type DateTime =
  String

pub type ClientName =
  String

pub type ResourceName =
  String

pub type ObjectTypes =
  String

pub type Target =
  String

pub type ReadingType =
  String

pub type Report =
  #(ObjectMetadata, ReportRequest, Anon97535fea)

pub type ResourceRequest =
  utils.Any

pub type Units =
  String

pub type Subscription =
  #(ObjectMetadata, SubscriptionRequest, Anon97535fea)

pub type Ven =
  #(ObjectMetadata, BlVenRequest)

pub type ObjectId =
  String

pub type Program =
  #(ObjectMetadata, ProgramRequest)

pub fn anon_97535fea_decoder() {
  use client_id <- decode.field("clientID", client_id_decoder())
  decode.success(Anon97535fea(client_id: client_id))
}

pub fn anon_97535fea_encode(data: Anon97535fea) {
  utils.object([#("clientID", client_id_encode(data.client_id))])
}

pub fn anon_85c77f13_decoder() {
  use bearer_token <- decode.optional_field(
    "bearerToken",
    None,
    decode.optional(decode.string),
  )
  use callback_url <- decode.field("callbackUrl", decode.string)
  use objects <- decode.field("objects", decode.list(object_types_decoder()))
  use operations <- decode.field("operations", decode.list(decode.string))
  decode.success(Anon85c77f13(
    bearer_token: bearer_token,
    callback_url: callback_url,
    objects: objects,
    operations: operations,
  ))
}

pub fn anon_85c77f13_encode(data: Anon85c77f13) {
  utils.object([
    #("bearerToken", json.nullable(data.bearer_token, json.string)),
    #("callbackUrl", json.string(data.callback_url)),
    #("objects", json.array(_, object_types_encode)(data.objects)),
    #("operations", json.array(_, json.string)(data.operations)),
  ])
}

pub fn anon_818bb683_decoder() {
  use interval_period <- decode.optional_field(
    "intervalPeriod",
    None,
    decode.optional(interval_period_decoder()),
  )
  use intervals <- decode.field("intervals", decode.list(interval_decoder()))
  use resource_name <- decode.field("resourceName", resource_name_decoder())
  decode.success(Anon818bb683(
    interval_period: interval_period,
    intervals: intervals,
    resource_name: resource_name,
  ))
}

pub fn anon_818bb683_encode(data: Anon818bb683) {
  utils.object([
    #(
      "intervalPeriod",
      json.nullable(data.interval_period, interval_period_encode),
    ),
    #("intervals", json.array(_, interval_encode)(data.intervals)),
    #("resourceName", resource_name_encode(data.resource_name)),
  ])
}

pub fn anon_25ddbf1f_decoder() {
  use url <- decode.field("URL", decode.string)
  decode.success(Anon25ddbf1f(url: url))
}

pub fn anon_25ddbf1f_encode(data: Anon25ddbf1f) {
  utils.object([#("URL", json.string(data.url))])
}

pub fn program_decoder() {
  use e0 <- decode.then(object_metadata_decoder())
  use e1 <- decode.then(program_request_decoder())
  decode.success(#(e0, e1))
}

pub fn program_encode(data: Program) {
  utils.merge([object_metadata_encode(data.0), program_request_encode(data.1)])
}

pub fn client_credential_response_decoder() {
  use access_token <- decode.field("access_token", decode.string)
  use expires_in <- decode.optional_field(
    "expires_in",
    None,
    decode.optional(decode.int),
  )
  use refresh_token <- decode.optional_field(
    "refresh_token",
    None,
    decode.optional(decode.string),
  )
  use scope <- decode.optional_field(
    "scope",
    None,
    decode.optional(decode.string),
  )
  use token_type <- decode.field("token_type", decode.string)
  decode.success(ClientCredentialResponse(
    access_token: access_token,
    expires_in: expires_in,
    refresh_token: refresh_token,
    scope: scope,
    token_type: token_type,
  ))
}

pub fn client_credential_response_encode(data: ClientCredentialResponse) {
  utils.object([
    #("access_token", json.string(data.access_token)),
    #("expires_in", json.nullable(data.expires_in, json.int)),
    #("refresh_token", json.nullable(data.refresh_token, json.string)),
    #("scope", json.nullable(data.scope, json.string)),
    #("token_type", json.string(data.token_type)),
  ])
}

pub fn object_id_decoder() {
  decode.string
}

pub fn object_id_encode(data: ObjectId) {
  json.string(data)
}

pub fn ven_decoder() {
  use e0 <- decode.then(object_metadata_decoder())
  use e1 <- decode.then(bl_ven_request_decoder())
  decode.success(#(e0, e1))
}

pub fn ven_encode(data: Ven) {
  utils.merge([object_metadata_encode(data.0), bl_ven_request_encode(data.1)])
}

pub fn auth_server_info_decoder() {
  use token_url <- decode.field("tokenURL", decode.string)
  decode.success(AuthServerInfo(token_url: token_url))
}

pub fn auth_server_info_encode(data: AuthServerInfo) {
  utils.object([#("tokenURL", json.string(data.token_url))])
}

pub fn interval_decoder() {
  use id <- decode.field("id", decode.int)
  use interval_period <- decode.optional_field(
    "intervalPeriod",
    None,
    decode.optional(interval_period_decoder()),
  )
  use payloads <- decode.field("payloads", decode.list(values_map_decoder()))
  decode.success(Interval(
    id: id,
    interval_period: interval_period,
    payloads: payloads,
  ))
}

pub fn interval_encode(data: Interval) {
  utils.object([
    #("id", json.int(data.id)),
    #(
      "intervalPeriod",
      json.nullable(data.interval_period, interval_period_encode),
    ),
    #("payloads", json.array(_, values_map_encode)(data.payloads)),
  ])
}

pub fn notifier_topics_response_decoder() {
  use topics <- decode.field("topics", notifier_operations_topics_decoder())
  decode.success(NotifierTopicsResponse(topics: topics))
}

pub fn notifier_topics_response_encode(data: NotifierTopicsResponse) {
  utils.object([#("topics", notifier_operations_topics_encode(data.topics))])
}

pub fn mqtt_notifier_binding_object_decoder() {
  use uris <- decode.field("URIS", decode.list(decode.string))
  use authentication <- decode.field("authentication", utils.any_decoder())
  use serialization <- decode.field("serialization", decode.string)
  decode.success(MqttNotifierBindingObject(
    uris: uris,
    authentication: authentication,
    serialization: serialization,
  ))
}

pub fn mqtt_notifier_binding_object_encode(data: MqttNotifierBindingObject) {
  utils.object([
    #("URIS", json.array(_, json.string)(data.uris)),
    #("authentication", utils.any_to_json(data.authentication)),
    #("serialization", json.string(data.serialization)),
  ])
}

pub fn subscription_decoder() {
  use e0 <- decode.then(object_metadata_decoder())
  use e1 <- decode.then(subscription_request_decoder())
  use e2 <- decode.then(anon_97535fea_decoder())
  decode.success(#(e0, e1, e2))
}

pub fn subscription_encode(data: Subscription) {
  utils.merge([
    object_metadata_encode(data.0),
    subscription_request_encode(data.1),
    anon_97535fea_encode(data.2),
  ])
}

pub fn event_request_decoder() {
  use duration <- decode.optional_field(
    "duration",
    None,
    decode.optional(duration_decoder()),
  )
  use event_name <- decode.optional_field(
    "eventName",
    None,
    decode.optional(decode.string),
  )
  use interval_period <- decode.optional_field(
    "intervalPeriod",
    None,
    decode.optional(interval_period_decoder()),
  )
  use intervals <- decode.optional_field(
    "intervals",
    None,
    decode.optional(decode.list(interval_decoder())),
  )
  use payload_descriptors <- decode.optional_field(
    "payloadDescriptors",
    None,
    decode.optional(decode.list(event_payload_descriptor_decoder())),
  )
  use priority <- decode.optional_field(
    "priority",
    None,
    decode.optional(decode.int),
  )
  use program_id <- decode.field("programID", object_id_decoder())
  use report_descriptors <- decode.optional_field(
    "reportDescriptors",
    None,
    decode.optional(decode.list(report_descriptor_decoder())),
  )
  use targets <- decode.optional_field(
    "targets",
    None,
    decode.optional(decode.list(target_decoder())),
  )
  decode.success(EventRequest(
    duration: duration,
    event_name: event_name,
    interval_period: interval_period,
    intervals: intervals,
    payload_descriptors: payload_descriptors,
    priority: priority,
    program_id: program_id,
    report_descriptors: report_descriptors,
    targets: targets,
  ))
}

pub fn event_request_encode(data: EventRequest) {
  utils.object([
    #("duration", json.nullable(data.duration, duration_encode)),
    #("eventName", json.nullable(data.event_name, json.string)),
    #(
      "intervalPeriod",
      json.nullable(data.interval_period, interval_period_encode),
    ),
    #(
      "intervals",
      json.nullable(data.intervals, json.array(_, interval_encode)),
    ),
    #(
      "payloadDescriptors",
      json.nullable(data.payload_descriptors, json.array(
        _,
        event_payload_descriptor_encode,
      )),
    ),
    #("priority", json.nullable(data.priority, json.int)),
    #("programID", object_id_encode(data.program_id)),
    #(
      "reportDescriptors",
      json.nullable(data.report_descriptors, json.array(
        _,
        report_descriptor_encode,
      )),
    ),
    #("targets", json.nullable(data.targets, json.array(_, target_encode))),
  ])
}

pub fn event_payload_descriptor_decoder() {
  use currency <- decode.optional_field(
    "currency",
    None,
    decode.optional(decode.string),
  )
  use object_type <- decode.field("objectType", decode.string)
  use payload_type <- decode.field("payloadType", decode.string)
  use units <- decode.optional_field(
    "units",
    None,
    decode.optional(units_decoder()),
  )
  decode.success(EventPayloadDescriptor(
    currency: currency,
    object_type: object_type,
    payload_type: payload_type,
    units: units,
  ))
}

pub fn event_payload_descriptor_encode(data: EventPayloadDescriptor) {
  utils.object([
    #("currency", json.nullable(data.currency, json.string)),
    #("objectType", json.string(data.object_type)),
    #("payloadType", json.string(data.payload_type)),
    #("units", json.nullable(data.units, units_encode)),
  ])
}

pub fn mqtt_notifier_authentication_anonymous_decoder() {
  use method_ <- decode.field("method", decode.string)
  decode.success(MqttNotifierAuthenticationAnonymous(method_: method_))
}

pub fn mqtt_notifier_authentication_anonymous_encode(
  data: MqttNotifierAuthenticationAnonymous,
) {
  utils.object([#("method", json.string(data.method_))])
}

pub fn units_decoder() {
  decode.string
}

pub fn units_encode(data: Units) {
  json.string(data)
}

pub fn notifiers_response_decoder() {
  use mqtt <- decode.optional_field(
    "MQTT",
    None,
    decode.optional(mqtt_notifier_binding_object_decoder()),
  )
  use webhook <- decode.field("WEBHOOK", decode.bool)
  decode.success(NotifiersResponse(mqtt: mqtt, webhook: webhook))
}

pub fn notifiers_response_encode(data: NotifiersResponse) {
  utils.object([
    #("MQTT", json.nullable(data.mqtt, mqtt_notifier_binding_object_encode)),
    #("WEBHOOK", json.bool(data.webhook)),
  ])
}

pub fn values_map_decoder() {
  use type_ <- decode.field("type", decode.string)
  use values <- decode.field("values", decode.list(utils.any_decoder()))
  decode.success(ValuesMap(type_: type_, values: values))
}

pub fn values_map_encode(data: ValuesMap) {
  utils.object([
    #("type", json.string(data.type_)),
    #("values", json.array(_, utils.any_to_json)(data.values)),
  ])
}

pub fn subscription_request_decoder() {
  use client_name <- decode.field("clientName", client_name_decoder())
  use object_operations <- decode.field(
    "objectOperations",
    decode.list(anon_85c77f13_decoder()),
  )
  use program_id <- decode.optional_field(
    "programID",
    None,
    decode.optional(object_id_decoder()),
  )
  use targets <- decode.optional_field(
    "targets",
    None,
    decode.optional(decode.list(target_decoder())),
  )
  decode.success(SubscriptionRequest(
    client_name: client_name,
    object_operations: object_operations,
    program_id: program_id,
    targets: targets,
  ))
}

pub fn subscription_request_encode(data: SubscriptionRequest) {
  utils.object([
    #("clientName", client_name_encode(data.client_name)),
    #(
      "objectOperations",
      json.array(_, anon_85c77f13_encode)(data.object_operations),
    ),
    #("programID", json.nullable(data.program_id, object_id_encode)),
    #("targets", json.nullable(data.targets, json.array(_, target_encode))),
  ])
}

pub fn notification_decoder() {
  use object <- decode.field(
    "object",
    decode.new_primitive_decoder("Nil", fn(_) { Ok(Nil) }),
  )
  use object_type <- decode.field("objectType", object_types_decoder())
  use operation <- decode.field("operation", decode.string)
  use targets <- decode.optional_field(
    "targets",
    None,
    decode.optional(decode.list(target_decoder())),
  )
  decode.success(Notification(
    object: object,
    object_type: object_type,
    operation: operation,
    targets: targets,
  ))
}

pub fn notification_encode(data: Notification) {
  utils.object([
    #("object", fn(_: Nil) { json.null() }(data.object)),
    #("objectType", object_types_encode(data.object_type)),
    #("operation", json.string(data.operation)),
    #("targets", json.nullable(data.targets, json.array(_, target_encode))),
  ])
}

pub fn client_credential_request_decoder() {
  use client_id <- decode.field("client_id", decode.string)
  use client_secret <- decode.field("client_secret", decode.string)
  use grant_type <- decode.field("grant_type", decode.string)
  use scope <- decode.optional_field(
    "scope",
    None,
    decode.optional(decode.string),
  )
  decode.success(ClientCredentialRequest(
    client_id: client_id,
    client_secret: client_secret,
    grant_type: grant_type,
    scope: scope,
  ))
}

pub fn client_credential_request_encode(data: ClientCredentialRequest) {
  utils.object([
    #("client_id", json.string(data.client_id)),
    #("client_secret", json.string(data.client_secret)),
    #("grant_type", json.string(data.grant_type)),
    #("scope", json.nullable(data.scope, json.string)),
  ])
}

pub fn resource_request_decoder() {
  utils.any_decoder()
}

pub fn resource_request_encode(data: ResourceRequest) {
  utils.any_to_json(data)
}

pub fn point_decoder() {
  use x <- decode.field("x", decode.float)
  use y <- decode.field("y", decode.float)
  decode.success(Point(x: x, y: y))
}

pub fn point_encode(data: Point) {
  utils.object([#("x", json.float(data.x)), #("y", json.float(data.y))])
}

pub fn report_descriptor_decoder() {
  use aggregate <- decode.optional_field(
    "aggregate",
    None,
    decode.optional(decode.bool),
  )
  use frequency <- decode.optional_field(
    "frequency",
    None,
    decode.optional(decode.int),
  )
  use historical <- decode.optional_field(
    "historical",
    None,
    decode.optional(decode.bool),
  )
  use num_intervals <- decode.optional_field(
    "numIntervals",
    None,
    decode.optional(decode.int),
  )
  use payload_type <- decode.field("payloadType", decode.string)
  use reading_type <- decode.optional_field(
    "readingType",
    None,
    decode.optional(reading_type_decoder()),
  )
  use repeat <- decode.optional_field(
    "repeat",
    None,
    decode.optional(decode.int),
  )
  use report_intervals <- decode.optional_field(
    "reportIntervals",
    None,
    decode.optional(decode.string),
  )
  use start_interval <- decode.optional_field(
    "startInterval",
    None,
    decode.optional(decode.int),
  )
  use targets <- decode.optional_field(
    "targets",
    None,
    decode.optional(decode.list(target_decoder())),
  )
  use units <- decode.optional_field(
    "units",
    None,
    decode.optional(units_decoder()),
  )
  decode.success(ReportDescriptor(
    aggregate: aggregate,
    frequency: frequency,
    historical: historical,
    num_intervals: num_intervals,
    payload_type: payload_type,
    reading_type: reading_type,
    repeat: repeat,
    report_intervals: report_intervals,
    start_interval: start_interval,
    targets: targets,
    units: units,
  ))
}

pub fn report_descriptor_encode(data: ReportDescriptor) {
  utils.object([
    #("aggregate", json.nullable(data.aggregate, json.bool)),
    #("frequency", json.nullable(data.frequency, json.int)),
    #("historical", json.nullable(data.historical, json.bool)),
    #("numIntervals", json.nullable(data.num_intervals, json.int)),
    #("payloadType", json.string(data.payload_type)),
    #("readingType", json.nullable(data.reading_type, reading_type_encode)),
    #("repeat", json.nullable(data.repeat, json.int)),
    #("reportIntervals", json.nullable(data.report_intervals, json.string)),
    #("startInterval", json.nullable(data.start_interval, json.int)),
    #("targets", json.nullable(data.targets, json.array(_, target_encode))),
    #("units", json.nullable(data.units, units_encode)),
  ])
}

pub fn report_decoder() {
  use e0 <- decode.then(object_metadata_decoder())
  use e1 <- decode.then(report_request_decoder())
  use e2 <- decode.then(anon_97535fea_decoder())
  decode.success(#(e0, e1, e2))
}

pub fn report_encode(data: Report) {
  utils.merge([
    object_metadata_encode(data.0),
    report_request_encode(data.1),
    anon_97535fea_encode(data.2),
  ])
}

pub fn reading_type_decoder() {
  decode.string
}

pub fn reading_type_encode(data: ReadingType) {
  json.string(data)
}

pub fn bl_ven_request_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(values_map_decoder())),
  )
  use client_id <- decode.field("clientID", client_id_decoder())
  use object_type <- decode.field("objectType", decode.string)
  use targets <- decode.optional_field(
    "targets",
    None,
    decode.optional(decode.list(target_decoder())),
  )
  use ven_name <- decode.field("venName", ven_name_decoder())
  decode.success(BlVenRequest(
    attributes: attributes,
    client_id: client_id,
    object_type: object_type,
    targets: targets,
    ven_name: ven_name,
  ))
}

pub fn bl_ven_request_encode(data: BlVenRequest) {
  utils.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, values_map_encode)),
    ),
    #("clientID", client_id_encode(data.client_id)),
    #("objectType", json.string(data.object_type)),
    #("targets", json.nullable(data.targets, json.array(_, target_encode))),
    #("venName", ven_name_encode(data.ven_name)),
  ])
}

pub fn mqtt_notifier_authentication_oauth2_bearer_token_decoder() {
  use method_ <- decode.field("method", decode.string)
  use username <- decode.field("username", decode.string)
  decode.success(MqttNotifierAuthenticationOauth2BearerToken(
    method_: method_,
    username: username,
  ))
}

pub fn mqtt_notifier_authentication_oauth2_bearer_token_encode(
  data: MqttNotifierAuthenticationOauth2BearerToken,
) {
  utils.object([
    #("method", json.string(data.method_)),
    #("username", json.string(data.username)),
  ])
}

pub fn target_decoder() {
  decode.string
}

pub fn target_encode(data: Target) {
  json.string(data)
}

pub fn auth_error_decoder() {
  use error <- decode.field("error", decode.string)
  use error_description <- decode.optional_field(
    "error_description",
    None,
    decode.optional(decode.string),
  )
  use error_uri <- decode.optional_field(
    "error_uri",
    None,
    decode.optional(decode.string),
  )
  decode.success(AuthError(
    error: error,
    error_description: error_description,
    error_uri: error_uri,
  ))
}

pub fn auth_error_encode(data: AuthError) {
  utils.object([
    #("error", json.string(data.error)),
    #("error_description", json.nullable(data.error_description, json.string)),
    #("error_uri", json.nullable(data.error_uri, json.string)),
  ])
}

pub fn object_types_decoder() {
  decode.string
}

pub fn object_types_encode(data: ObjectTypes) {
  json.string(data)
}

pub fn resource_name_decoder() {
  decode.string
}

pub fn resource_name_encode(data: ResourceName) {
  json.string(data)
}

pub fn report_request_decoder() {
  use client_name <- decode.field("clientName", client_name_decoder())
  use event_id <- decode.field("eventID", object_id_decoder())
  use payload_descriptors <- decode.optional_field(
    "payloadDescriptors",
    None,
    decode.optional(decode.list(report_payload_descriptor_decoder())),
  )
  use report_name <- decode.optional_field(
    "reportName",
    None,
    decode.optional(decode.string),
  )
  use resources <- decode.field(
    "resources",
    decode.list(anon_818bb683_decoder()),
  )
  decode.success(ReportRequest(
    client_name: client_name,
    event_id: event_id,
    payload_descriptors: payload_descriptors,
    report_name: report_name,
    resources: resources,
  ))
}

pub fn report_request_encode(data: ReportRequest) {
  utils.object([
    #("clientName", client_name_encode(data.client_name)),
    #("eventID", object_id_encode(data.event_id)),
    #(
      "payloadDescriptors",
      json.nullable(data.payload_descriptors, json.array(
        _,
        report_payload_descriptor_encode,
      )),
    ),
    #("reportName", json.nullable(data.report_name, json.string)),
    #("resources", json.array(_, anon_818bb683_encode)(data.resources)),
  ])
}

pub fn report_payload_descriptor_decoder() {
  use accuracy <- decode.optional_field(
    "accuracy",
    None,
    decode.optional(decode.float),
  )
  use confidence <- decode.optional_field(
    "confidence",
    None,
    decode.optional(decode.int),
  )
  use object_type <- decode.field("objectType", decode.string)
  use payload_type <- decode.field("payloadType", decode.string)
  use reading_type <- decode.optional_field(
    "readingType",
    None,
    decode.optional(reading_type_decoder()),
  )
  use units <- decode.optional_field(
    "units",
    None,
    decode.optional(units_decoder()),
  )
  decode.success(ReportPayloadDescriptor(
    accuracy: accuracy,
    confidence: confidence,
    object_type: object_type,
    payload_type: payload_type,
    reading_type: reading_type,
    units: units,
  ))
}

pub fn report_payload_descriptor_encode(data: ReportPayloadDescriptor) {
  utils.object([
    #("accuracy", json.nullable(data.accuracy, json.float)),
    #("confidence", json.nullable(data.confidence, json.int)),
    #("objectType", json.string(data.object_type)),
    #("payloadType", json.string(data.payload_type)),
    #("readingType", json.nullable(data.reading_type, reading_type_encode)),
    #("units", json.nullable(data.units, units_encode)),
  ])
}

pub fn problem_decoder() {
  use detail <- decode.optional_field(
    "detail",
    None,
    decode.optional(decode.string),
  )
  use instance <- decode.optional_field(
    "instance",
    None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    None,
    decode.optional(decode.int),
  )
  use title <- decode.optional_field(
    "title",
    None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    None,
    decode.optional(decode.string),
  )
  decode.success(Problem(
    detail: detail,
    instance: instance,
    status: status,
    title: title,
    type_: type_,
  ))
}

pub fn problem_encode(data: Problem) {
  utils.object([
    #("detail", json.nullable(data.detail, json.string)),
    #("instance", json.nullable(data.instance, json.string)),
    #("status", json.nullable(data.status, json.int)),
    #("title", json.nullable(data.title, json.string)),
    #("type", json.nullable(data.type_, json.string)),
  ])
}

pub fn client_name_decoder() {
  decode.string
}

pub fn client_name_encode(data: ClientName) {
  json.string(data)
}

pub fn bl_resource_request_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(values_map_decoder())),
  )
  use client_id <- decode.field("clientID", client_id_decoder())
  use object_type <- decode.field("objectType", decode.string)
  use resource_name <- decode.field("resourceName", resource_name_decoder())
  use targets <- decode.optional_field(
    "targets",
    None,
    decode.optional(decode.list(target_decoder())),
  )
  use ven_id <- decode.field("venID", object_id_decoder())
  decode.success(BlResourceRequest(
    attributes: attributes,
    client_id: client_id,
    object_type: object_type,
    resource_name: resource_name,
    targets: targets,
    ven_id: ven_id,
  ))
}

pub fn bl_resource_request_encode(data: BlResourceRequest) {
  utils.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, values_map_encode)),
    ),
    #("clientID", client_id_encode(data.client_id)),
    #("objectType", json.string(data.object_type)),
    #("resourceName", resource_name_encode(data.resource_name)),
    #("targets", json.nullable(data.targets, json.array(_, target_encode))),
    #("venID", object_id_encode(data.ven_id)),
  ])
}

pub fn date_time_decoder() {
  decode.string
}

pub fn date_time_encode(data: DateTime) {
  json.string(data)
}

pub fn client_id_decoder() {
  decode.string
}

pub fn client_id_encode(data: ClientId) {
  json.string(data)
}

pub fn duration_decoder() {
  decode.string
}

pub fn duration_encode(data: Duration) {
  json.string(data)
}

pub fn ven_name_decoder() {
  decode.string
}

pub fn ven_name_encode(data: VenName) {
  json.string(data)
}

pub fn program_request_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(values_map_decoder())),
  )
  use interval_period <- decode.optional_field(
    "intervalPeriod",
    None,
    decode.optional(interval_period_decoder()),
  )
  use payload_descriptors <- decode.optional_field(
    "payloadDescriptors",
    None,
    decode.optional(decode.list(utils.any_decoder())),
  )
  use program_descriptions <- decode.optional_field(
    "programDescriptions",
    None,
    decode.optional(decode.list(anon_25ddbf1f_decoder())),
  )
  use program_name <- decode.field("programName", decode.string)
  use targets <- decode.optional_field(
    "targets",
    None,
    decode.optional(decode.list(target_decoder())),
  )
  decode.success(ProgramRequest(
    attributes: attributes,
    interval_period: interval_period,
    payload_descriptors: payload_descriptors,
    program_descriptions: program_descriptions,
    program_name: program_name,
    targets: targets,
  ))
}

pub fn program_request_encode(data: ProgramRequest) {
  utils.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, values_map_encode)),
    ),
    #(
      "intervalPeriod",
      json.nullable(data.interval_period, interval_period_encode),
    ),
    #(
      "payloadDescriptors",
      json.nullable(data.payload_descriptors, json.array(_, utils.any_to_json)),
    ),
    #(
      "programDescriptions",
      json.nullable(data.program_descriptions, json.array(
        _,
        anon_25ddbf1f_encode,
      )),
    ),
    #("programName", json.string(data.program_name)),
    #("targets", json.nullable(data.targets, json.array(_, target_encode))),
  ])
}

pub fn notifier_operations_topics_decoder() {
  use all <- decode.optional_field("ALL", None, decode.optional(decode.string))
  use create <- decode.optional_field(
    "CREATE",
    None,
    decode.optional(decode.string),
  )
  use delete <- decode.field("DELETE", decode.string)
  use update <- decode.field("UPDATE", decode.string)
  decode.success(NotifierOperationsTopics(
    all: all,
    create: create,
    delete: delete,
    update: update,
  ))
}

pub fn notifier_operations_topics_encode(data: NotifierOperationsTopics) {
  utils.object([
    #("ALL", json.nullable(data.all, json.string)),
    #("CREATE", json.nullable(data.create, json.string)),
    #("DELETE", json.string(data.delete)),
    #("UPDATE", json.string(data.update)),
  ])
}

pub fn interval_period_decoder() {
  use duration <- decode.optional_field(
    "duration",
    None,
    decode.optional(duration_decoder()),
  )
  use randomize_start <- decode.optional_field(
    "randomizeStart",
    None,
    decode.optional(duration_decoder()),
  )
  use start <- decode.optional_field(
    "start",
    None,
    decode.optional(date_time_decoder()),
  )
  decode.success(IntervalPeriod(
    duration: duration,
    randomize_start: randomize_start,
    start: start,
  ))
}

pub fn interval_period_encode(data: IntervalPeriod) {
  utils.object([
    #("duration", json.nullable(data.duration, duration_encode)),
    #("randomizeStart", json.nullable(data.randomize_start, duration_encode)),
    #("start", json.nullable(data.start, date_time_encode)),
  ])
}

pub fn event_decoder() {
  use e0 <- decode.then(object_metadata_decoder())
  use e1 <- decode.then(event_request_decoder())
  decode.success(#(e0, e1))
}

pub fn event_encode(data: Event) {
  utils.merge([object_metadata_encode(data.0), event_request_encode(data.1)])
}

pub fn ven_request_decoder() {
  utils.any_decoder()
}

pub fn ven_request_encode(data: VenRequest) {
  utils.any_to_json(data)
}

pub fn resource_decoder() {
  use e0 <- decode.then(object_metadata_decoder())
  use e1 <- decode.then(bl_resource_request_decoder())
  decode.success(#(e0, e1))
}

pub fn resource_encode(data: Resource) {
  utils.merge([
    object_metadata_encode(data.0),
    bl_resource_request_encode(data.1),
  ])
}

pub fn object_metadata_decoder() {
  use created_date_time <- decode.field("createdDateTime", date_time_decoder())
  use id <- decode.field("id", object_id_decoder())
  use modification_date_time <- decode.field(
    "modificationDateTime",
    date_time_decoder(),
  )
  use object_type <- decode.field("objectType", object_types_decoder())
  decode.success(ObjectMetadata(
    created_date_time: created_date_time,
    id: id,
    modification_date_time: modification_date_time,
    object_type: object_type,
  ))
}

pub fn object_metadata_encode(data: ObjectMetadata) {
  utils.object([
    #("createdDateTime", date_time_encode(data.created_date_time)),
    #("id", object_id_encode(data.id)),
    #("modificationDateTime", date_time_encode(data.modification_date_time)),
    #("objectType", object_types_encode(data.object_type)),
  ])
}

pub fn ven_ven_request_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(values_map_decoder())),
  )
  use object_type <- decode.field("objectType", decode.string)
  use ven_name <- decode.field("venName", ven_name_decoder())
  decode.success(VenVenRequest(
    attributes: attributes,
    object_type: object_type,
    ven_name: ven_name,
  ))
}

pub fn ven_ven_request_encode(data: VenVenRequest) {
  utils.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, values_map_encode)),
    ),
    #("objectType", json.string(data.object_type)),
    #("venName", ven_name_encode(data.ven_name)),
  ])
}

pub fn mqtt_notifier_authentication_certificate_decoder() {
  use ca_cert <- decode.field("caCert", decode.string)
  use client_cert <- decode.field("clientCert", decode.string)
  use client_key <- decode.field("clientKey", decode.string)
  use method_ <- decode.field("method", decode.string)
  decode.success(MqttNotifierAuthenticationCertificate(
    ca_cert: ca_cert,
    client_cert: client_cert,
    client_key: client_key,
    method_: method_,
  ))
}

pub fn mqtt_notifier_authentication_certificate_encode(
  data: MqttNotifierAuthenticationCertificate,
) {
  utils.object([
    #("caCert", json.string(data.ca_cert)),
    #("clientCert", json.string(data.client_cert)),
    #("clientKey", json.string(data.client_key)),
    #("method", json.string(data.method_)),
  ])
}

pub fn ven_resource_request_decoder() {
  use attributes <- decode.optional_field(
    "attributes",
    None,
    decode.optional(decode.list(values_map_decoder())),
  )
  use object_type <- decode.field("objectType", decode.string)
  use resource_name <- decode.field("resourceName", resource_name_decoder())
  use ven_id <- decode.field("venID", object_id_decoder())
  decode.success(VenResourceRequest(
    attributes: attributes,
    object_type: object_type,
    resource_name: resource_name,
    ven_id: ven_id,
  ))
}

pub fn ven_resource_request_encode(data: VenResourceRequest) {
  utils.object([
    #(
      "attributes",
      json.nullable(data.attributes, json.array(_, values_map_encode)),
    ),
    #("objectType", json.string(data.object_type)),
    #("resourceName", resource_name_encode(data.resource_name)),
    #("venID", object_id_encode(data.ven_id)),
  ])
}
