view: orders
{
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
     link: {
      label: "Show as stacked line"
      url: "
      {% assign vis_config = '{
      \"stacking\" : \"normal\",
      \"legend_position\" : \"right\",
      \"x_axis_gridlines\" : false,
      \"y_axis_gridlines\" : true,
      \"show_view_names\" : false,
      \"y_axis_combined\" : true,
      \"show_y_axis_labels\" : true,
      \"show_y_axis_ticks\" : true,
      \"y_axis_tick_density\" : \"default\",
      \"show_x_axis_label\" : true,
      \"show_x_axis_ticks\" : true,
      \"show_null_points\" : false,
      \"interpolation\" : \"monotone\",
      \"type\" : \"looker_line\",
      \"colors\": [
      \"#5245ed\",
      \"#ff8f95\",
      \"#1ea8df\",
      \"#353b49\",
      \"#49cec1\",
      \"#b3a0dd\"
      ],
      \"x_axis_label\" : \"Month Number\"
      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&sorts=order_items.created_year+asc,order_items.created_month_name+asc&pivots=order_items.created_year&toggle=dat,pik,vis&limit=500&column_limit=15"
    } # NOTE the &pivots=

  }




  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
