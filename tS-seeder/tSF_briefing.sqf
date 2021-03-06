//     tSF Briefing
// Do not modify this part
#define BRIEFING		_briefing = [];
#define TOPIC(NAME) 	_briefing pushBack ["Diary", [ NAME,
#define END			]];
#define ADD_TOPICS	for "_i" from (count _briefing) to 0 step -1 do {player createDiaryRecord (_briefing select _i);};
//
//
// Briefing goes here

BRIEFING

TOPIC("I. Обстановка:")
"После кампании 2013 года государственность Арабской Республики Такистан была полностью уничтожена и после уходя армии США в 2015ом - страну захлестнула война между различными исламистскими течениями. <br /><br />Корпорации, которые получили права на разработку месторождений, были вынуждены прибегнуть к услугам ЧВК, чтобы обезопасить свою собственность и интересы в регионе. Вскоре стало ясно, что поддерживать островки безопасности в море хаоса слишком сложно, а урегулировать конфликт не представляется возможным  - участников слишком много, чтобы можно было с кем-то договориться. Финансировать же новую армию Такистана никто не решается, т.к. дезертирство приобрело массовый характер и эффективность армии близка к нулю.<br /><br />Недавно один из крупнейших игроков в регионе в ходе длительных переговоров взял на себя обязательства по обеспечению безопасности в обмен на неназванные бенефиции. На основе полуразвалившихся ВС Такистана, вооруженных оставленной американцами техникой и оружием, и специалистов корпорации была сформирована бригада оперативного реагирования «Рапира» призванная решать вопросы безопасности на всей территории Такистана.<br />"
END

TOPIC("А. Враждебные силы:")
"Различные исламистские группировки общей численностью в 3000 - 5000 человек. Состоят из местного населения и боевиков из других исламских стран. <br /><br />Известно, что многие группировки финансируются крупными игроками на рынке нефти с целью сделать добычу в Такистане не рентабельной."
END

TOPIC("Б. Дружественные силы:")
"Вооруженные силы Демократической Республики Такистан.<br /><br />Армия оснащена преимущественно американским вооружением и техникой, переданными новому правительству во время ухода армии США из Такистана."
END

TOPIC("II. Задание:")
"- Обеспечивать оперативное реагирование на активность противника в регионе; <br />- Демонстрация присутствия;<br />- Защита материальной собственности и персонала корпораций."
END

TOPIC("III. Выполнение:")
"Разведка создала хорошую агентурную сеть, так что активность противника для нас не является загадкой. Используйте актуальную информацию для выбора задач.<br />"
END

TOPIC("IV. Поддержка:")
"ВС Такистана готовы обеспечить поддержку наших акций (транспорт, артиллерия)."
END

TOPIC("V. Замечания:")
"- Для получения новых задач и для завершения текущих используйте ACE меню (Self-Interaction) - Radio - HQ.
<br />- Для вызова транспортной авиации используйте ACE меню (Self-Interaction) - Radio - Evac Service. Вам нужно будет получить подтверждение от текущего лидера вашего отряда.
<br />- Доступна возможность установки Точки сбора (Rallypoint) для быстрого перемещения игроков к лидеру отряда.
<br />- Для уменьшение\увеличения дистанции видимости проверьте радел tS Notes. Там же вы найдете шпаргалку об Отчетах, ТССС, наведении авиации и артиллерии."
END

ADD_TOPICS

