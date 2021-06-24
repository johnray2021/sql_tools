/* For Mysql 5.7 */
select replace(group_concat(substring(pwd_char,char_pos,1)),',','')
  from (select '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^&*' as pwd_char,
               1 as pos_id,round(rand()*52+10.5) as char_pos
        union all
        select *
          from (select '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^&*' as pwd_char) t1, /*首字符为英文字母*/
               (select 2 as pos_id,round(rand()*9+62.5) as char_pos union all    /*包含两个特殊字符*/
                select 3 as pos_id,round(rand()*9+62.5) as char_pos union all    /*包含两个特殊字符*/
                select 4 as pos_id,round(rand()*61+0.5) as char_pos union all   
                select 5 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 6 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 7 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 8 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 9 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 10 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 11 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 12 as pos_id,round(rand()*61+0.5) as char_pos union all 
                select 13 as pos_id,round(rand()*61+0.5) as char_pos             /*共生成13位长度的密码字符串*/
                order by rand()                                                  /*随机排列特殊字符的位置顺序*/
               ) t2
        ) t3;
