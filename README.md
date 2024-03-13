
----
# DCR-L2jMobius

----
Компиляция происходит в системе **Alpine Linux**. 
Производиться автоматическая установка **ANT 1.10.14** и **JDK 17**.
Автоматически скачивается репозиторий исходного кода.

Вы с помощью аргументов компиляции определяете какую сборку вам необходимо скомпилировать.
С помощью монтирования локальной папки в контейнер на выходе получаете готовый скомпилированный архив.

----

**Запуск компиляции:**

`docker run --name dcr-l2jmobius -d -v {local/path}:/home/ mindevis/dcr-l2jmobius:latest L2J_Mobius_C6_Interlude`

В данном примере происходит компиляция в фоновом режиме.

**Пример:**

**Windows:** `docker run --name dcr-l2jmobius -d -v D:\compile:/home/ mindevis/dcr-l2jmobius:latest L2J_Mobius_C6_Interlude`

**Linux:** `docker run --name dcr-l2jmobius -d -v /home/compile:/home/ mindevis/dcr-l2jmobius:latest L2J_Mobius_C6_Interlude`

----

В данном примере происходит компиляция в интерактивном режиме. Вы можете увидеть весь этап компиляции.

**Пример:**

**Windows:** `docker run --name dcr-l2jmobius -it -v D:\compile:/home/ mindevis/dcr-l2jmobius:latest L2J_Mobius_C6_Interlude`

**Linux:** `docker run --name dcr-l2jmobius -it -v /home/compile:/home/ mindevis/dcr-l2jmobius:latest L2J_Mobius_C6_Interlude`

----

**Аргументы компиляции**

Важно!!!! Может быть использован для компиляции только один аргумент !!!!

<table border="0">
<tr>
<td>L2J_Mobius_01.0_Ertheia</td>
<td>L2J_Mobius_02.5_Underground</td>
<td>L2J_Mobius_03.0_Helios</td>
</tr>
<tr>
<td>L2J_Mobius_04.0_GrandCrusade</td>
<td>L2J_Mobius_05.0_Salvation</td>
<td>L2J_Mobius_05.5_EtinasFate</td>
</tr>
<tr>
<td>L2J_Mobius_06.0_Fafurion</td>
<td>L2J_Mobius_07.0_PreludeOfWar</td>
<td>L2J_Mobius_08.2_Homunculus</td>
</tr>
<tr>
<td>L2J_Mobius_09.2_ReturnOfTheQueenAnt</td>
<td>L2J_Mobius_10.3_MasterClass</td>
<td>L2J_Mobius_11.1_TheSourceOfFlame</td>
</tr>
<tr>
<td>L2J_Mobius_C1_HarbingersOfWar</td>
<td>L2J_Mobius_C4_ScionsOfDestiny</td>
<td>L2J_Mobius_C6_Interlude</td>
</tr>
<tr>
<td>L2J_Mobius_CT_0_Interlude</td>
<td>L2J_Mobius_CT_2.4_Epilogue</td>
<td>L2J_Mobius_CT_2.6_HighFive</td>
</tr>
<tr>
<td>L2J_Mobius_Classic_1.0</td>
<td>L2J_Mobius_Classic_1.5_AgeOfSplendor</td>
<td>L2J_Mobius_Classic_2.0_Saviors</td>
</tr>
<tr>
<td>L2J_Mobius_Classic_2.5_Zaken</td>
<td>L2J_Mobius_Classic_2.7_Antharas</td>
<td>L2J_Mobius_Classic_2.8_SevenSigns</td>
</tr>
<tr>
<td>L2J_Mobius_Classic_2.9.5_Saviors</td>
<td>L2J_Mobius_Classic_2.9_SecretOfEmpire</td>
<td>L2J_Mobius_Classic_3.0_TheKamael</td>
</tr>
<tr>
<td>L2J_Mobius_Classic_Interlude</td>
<td>L2J_Mobius_Essence_4.2_DwellingOfSpirits</td>
<td>L2J_Mobius_Essence_5.2_FrostLord</td>
</tr>
<tr>
<td>L2J_Mobius_Essence_6.3_Crusader</td>
<td>L2J_Mobius_Essence_7.1_Assassin</td>
</tr>
</table>

----

-v {local/path}:/home/

Путь к папке на локальной машине, не в контейнере!!!!!

----

**ВАЖНО!!!**

В настройках Docker для Windows у вас должна быть расшарена папка для контейнера.

<img src="https://i.imgur.com/WUdGfHB.png" alt="drawing" />
