view: xss_test_10v1 {
  sql_table_name: demo_db.xss_test_10v1 ;;

  dimension: div_stylebackgroundimage_urljavascriptprompt2 {
    type: string
    sql: ${TABLE}.`<div style="background-image: url('javascript:prompt(2)')">` ;;
  }
  measure: count {
    type: count
  }
}