SELECT `le_t`.*, (`ff`.`countTLS` / `ff`.`countPageloads`) * 100 AS `percentPageloadsAreTLS`
  FROM `lestats`.`le_timeline` AS le_t
  LEFT JOIN `ctdb`.`firefoxpageloadstls` AS ff
  ON `ff`.`datestamp`=`le_t`.`datestamp`;
