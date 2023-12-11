view: employees {
  sql_table_name: demo_db.Employees ;;

  dimension: emp_id {
    type: number
    sql: ${TABLE}.EmpID ;;
  }
  dimension: manager {
    type: number
    sql: ${TABLE}.Manager ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }

  dimension: advertiser_name {
    type: string
    sql: ${TABLE}.Name ;;
    group_label: "Advertiser Details"
    link: {
      label: "Advertiser Profile"
      url: "https://aaa.ad.net/web/home#/dashboard/advertiser/{{ name._value }}"
      icon_url: "https://aaa.ad.net/web/images/favicon.ico?v=2"
    }
  }

}
