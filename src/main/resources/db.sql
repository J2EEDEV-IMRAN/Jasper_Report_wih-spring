CREATE OR REPLACE VIEW VIEW_sections AS
 SELECT
 t1.id,
 t1.act_id,
 t1.part_id,
 t1.chapter_id,
 t1.sections_no,
 t1.sections_name,
 t2.`chapter_no`,
 t2.`chapter_name`,
 t2.`c_order` as chapterOrder,
 t2.`foot_note` as chapterFootNote,
 t2.`note_possition` as chapterNotePosition,
 t3.`part_no`,
 t3.`part_name`,
 t3.`p_order` as partOrder,
 t3.`foot_note` as partFootNote,
 t3.`note_possition`as partNotePosition,
 t1.section_description,
 t1.sections_head,
 t1.sec_table

 FROM `sections` as t1
 LEFT  JOIN chapter as t2 ON t1.chapter_id=t2.id
 LEFT  JOIN part as t3 ON t1.part_id=t3.id

CREATE OR REPLACE VIEW VIEW_act_foot_note AS SELECT t1.foot_note as footNote, t1.note_number, t1.section_id,t1.note_type as act_id,t1.note_possition FROM `foot_note` as t1 WHERE t1.note_type!=''
ORDER BY `t1`.`note_type` ASC