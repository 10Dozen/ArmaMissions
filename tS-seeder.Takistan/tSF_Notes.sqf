/*
	Settings
*/

tSF_note_displayName				= "tS Notes";
tSF_note_enableNineliner			= true;
tSF_note_enableArtilleryControl		= true;
tSF_note_enableAdvancedMedicine		= true;
tSF_note_enableReports				= true;
tSF_note_enableALIVENote			= true;


	
// ********** Topics ****************
#define NOTES		private["_topics"]; _topics = []; player createDiarySubject ["tSF_Notespage",tSF_note_displayName];
#define TOPIC(Y, NAME) 	if (Y) then { _topics pushBack ["tSF_Notespage", [ NAME,
#define END			]]; };
#define ADD_TOPICS	for "_i" from (count _topics) to 0 step -1 do {player createDiaryRecord (_topics select _i);};

NOTES	

TOPIC(tSF_note_enableReports, "Отчеты")
 "<font color='#12C4FF' size='14'>ACE (Доклад о состоянии)</font><br />Патроны - Потери - Спецсредства подразделения или отдельного бойца.<br /><font color='#009900'>ЗЕЛЕНЫЙ</font> <font color='#9E9E9E'>- готов продолжать бой (боеприпасов достаточно, нет раненых, есть АТ стредства/взрывчатка).</font><br /><font color='#cc9900'>ЖЕЛТЫЙ</font> <font color='#9E9E9E'>- все еще готов продолжать бой (часть боеприпасов истрачены, есть раненые, частично потрачены спецсредства).</font><br /><font color='#990000'>КРАСНЫЙ</font> <font color='#9E9E9E'>- не готов продолжать бой (боеприпасы заканчиваются, есть тяжелораненные, почти полностью отсутствуют спецсредства).</font><br /><font color='#000000'>ЧЕРНЫЙ</font> <font color='#9E9E9E'>- не может продолжать бой (нет боеприпасов, есть убитые, нет спецсредств).</font><br /><br /><font color='#5E5E5E'>Опросить всех подчиненных, оценить состояние и передать</font><br /><font color='#12C4FF'>Альфа 1-6, это 1-1, желтый, зеленый, зеленый. Конец.</font><br /><br /><font color='#12C4FF' size='14'>SITREP (Доклад об обстановке)</font><br />1. Описание текущего метсонахождения <font color='#9E9E9E'>(координаты, ориентир)</font> и направления движения<br />2. что делаешь сейчас <font color='#9E9E9E'>(находишься ли в бою?)</font><br />3. что будешь делать <font color='#9E9E9E'>(продолжать движение, отступить, продолжать бой?)</font><br />4. потребности <font color='#9E9E9E'>(нужны ли патроны, медикаменты, эвакуация, поддержка?)</font><br /><br /><font color='#5E5E5E'>Подготовьте отчет и ответьте в виде:</font><br /><font color='#12C4FF'>1-6, это 1-1. Достигли точки 2, двигаемся к точке 3 и будем наблюдать за городом, у нас без потерь. Прием.</font>"
END

TOPIC(tSF_note_enableAdvancedMedicine, "TCCC")
"<font color='#12C4FF' size='14'>Оказание первой помощи в зонах</font><br /><font color='#990000'>КРАСНАЯ</font> <font color='#9E9E9E'>- первичный осмотр, наложение жгутов</font><br /><font color='#cc9900'>ЖЕЛТАЯ</font> <font color='#9E9E9E'>- полный осмотр, полная перевязка, CPR, ослабление жгутов, ввод препаратов</font><br /><font color='#009900'>ЗЕЛЕНАЯ</font> <font color='#9E9E9E'>- полный осмотр, полная перевязка, CPR, ввод препаратов, переливание крови, хирургическое вмешательство</font><br /><br /><font color='#12C4FF' size='14'>Порядок оказания первой помощи</font><br />1. Проверить сознание, пульс<br />2. Осмотреть на наличие ран<br />3. Наложить жгут<br />4. Перевязать раны<br />5. Использовать препараты чтобы привести в сознание<br /><br /><font color='#12C4FF' size='14'>Перевязка</font><br />Компресионный пакет / Packing Bandage <font color='#9E9E9E'>-  Отрыв, Ушиб, Ссадина, Огнестрельная / Avulsion, Bruise, Scrape, Velocity</font><br />Давящая повязка / Elastic Bandage <font color='#9E9E9E'>-  Колотая, Компресионная, Резаная, Рваная / Puncture, Crush, Cut, Laceration</font><br /><br /><font color='#12C4FF' size='14'>Препараты</font><br />Морфин / Morphine <font color='#9E9E9E'>- болеутоляющее, понижает пульс на 40 ударов в минуту!</font><br />Атропин / Atropine <font color='#9E9E9E'>- понижает пульс на 20-40 ударов в минуту.</font><br />Эпинефрин / Epinephrine <font color='#9E9E9E'>- синтетический адреналин, применять для приведения в сознание, повышает пульс на 20-40 ударов в минуту.</font><br />"
END

TOPIC( tSF_note_enableNineliner, "Запрос CAS (9-Liner)")
"<font color='#12C4FF' size='14'>КОЛЬТ-1, это Альфа-1-1, контроль тип ___(1,2,3), примите девять линий. Прием.</font><br /><font color='#5E5E5E'>дождитесь подтверждения от пилота и передайте девять линий</font><br /><br />КОНТРОЛЬ > <font color='#9E9E9E'>1 (атака по указанной позиции), 2 (поиск и уничтожение цели в районе позиции), 3 (атака любых найденых целей в районе позиции)</font><br />1. IP/BP > <font color='#9E9E9E'>Наименовани точки подхода</font><br />2. НАПРАВЛЕНИЕ > <font color='#9E9E9E'>0...359 градусов (от IP до цели)</font><br />3. ДИСТАНЦИЯ > <font color='#9E9E9E'>в метрах (от IP до цели)</font><br />4. ВОЗВЫШЕНИЕ ЦЕЛИ > <font color='#9E9E9E'>в метрах</font><br />5. ОПИСАНИЕ ЦЕЛИ > <font color='#9E9E9E'>(например, 'одна БМП', 'отделение пехоты')</font><br />6. ПОЗИЦИЯ ЦЕЛИ > <font color='#9E9E9E'>XXXX YYYY (например, 0349 0120)</font><br />7. ПОДСВЕТКА ЦЕЛИ > <font color='#9E9E9E'>Нет / Дым / Лазер</font><br />8. ДРУЖЕСТВЕННЫЕ СИЛЫ > <font color='#9E9E9E'>Направление и дистанция от цели до союзных сил</font><br />9. УХОД > <font color='#9E9E9E'>Направление выхода из зоны удара</font><br /><br /><font color='#5E5E5E'>Не передавайте номера линий и их заголовки (т.е. говорите '400 метров' вместо 'Пункт 3. Дистанция 400 метров').<br /></font>"
END

TOPIC(tSF_note_enableArtilleryControl, "Запрос Артиллерийского огня")
"<font color='#12C4FF' size='14'>Фокстрот, это Альфа-1-1, запрашиваю арт.удар. Прием.</font><br /><font color='#5E5E5E'>ожидайте ответа артиллерии, затем передавайте запрос</font><br /><br /><font color='#12C4FF' size='14'>Фокстрот, это Альфа-1-1, позиция цели (1) 3312 2231 , (2) один БМП, (3) 3 HE снаряда. Конец.</font><br />1. ПОЗИЦИЯ ЦЕЛИ > <font color='#9E9E9E'>XXXX YYYY (например, 0349 0120)</font><br />2. ОПИСАНИЕ ЦЕЛИ > <font color='#9E9E9E'>(например, 'одна БМП', 'отделение пехоты')</font><br />3. КОЛ-ВО и ТИП СНАРЯДОВ > <font color='#9E9E9E'>(например, 10 HE/фугасных, 2 дымовых, 3 зажигательных)</font><br /><br /><font color='#5E5E5E'>ожидайте разрыва 1го снаряда и сделайте поправку</font><br /><font color='#12C4FF' size='14'>Фокстрот, это Альфа-1-1, коррекция, (4) 200 (5) ПЕРЕЛЕТ. Конец.</font><br />4. ПОПРАВКА СМЕЩЕНИЯ > <font co`lor='#9E9E9E'>в метрах (от разрыва)</font><br />5. ПОПРАВКА НАПРАВЛЕНИЯ > <font color='#9E9E9E'>слева, справа, перелет (за целью), недолет (перед целью)</font><br /><br /><font color='#5E5E5E'>дождитесь следующего выстрела и продолжайте корректировку до точного попадания; затем запросите огонь на поражение</font><br /><font color='#12C4FF' size='14'>Фокстрот, это Альфа-1-1, огонь на поражение. Конец.</font>"
END

ADD_TOPICS
