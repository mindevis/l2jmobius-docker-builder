Хочу представить вашему вниманию образ для компиляции исходного кода **L2jMobius** без установки **JDK**, **ANT**, **сред разработки**.
----

Компиляция происходит в системе **Debian Linux**. 
Производиться автоматическая установка **ANT** и **JDK 17**.
Автоматически скачивается репозиторий исходного кода.

Вы с помощью аргументов компиляции определяете какую сборку вам необходимо скомпилировать.
С помощью монтирования локальной папки в контейнер на выходе получаете готовый скомпилированный архив.

----

**Запуск компиляции:**

`docker run -d -v {local/path}:/home/ mindevis/dcr-l2jmobius L2J_Mobius_CT_2.6_HighFive`

В данном примере происходит компиляция в фоновом режиме.

**Пример:**

**Windows:** `docker run -d -v D:\compile:/home/ mindevis/dcr-l2jmobius L2J_Mobius_CT_2.6_HighFive`

**Linux:** `docker run -d -v /home/compile:/home/ mindevis/dcr-l2jmobius L2J_Mobius_CT_2.6_HighFive`

----

В данном примере происходит компиляция в интерактивном режиме. Вы можете увидеть весь этап компиляции.

**Пример:**

**Windows:** `docker run -it -v D:\compile:/home/ mindevis/dcr-l2jmobius L2J_Mobius_CT_2.6_HighFive`

**Linux:** `docker run -it -v /home/compile:/home/ mindevis/dcr-l2jmobius L2J_Mobius_CT_2.6_HighFive`

----

**Аргументы компиляции**

Важно!!!! Может быть использован для компиляции только один аргумент !!!!

<table border="0">
<tr>
<td>L2J_Mobius_1.0_Ertheia</td>
<td>L2J_Mobius_2.5_Underground</td>
<td>L2J_Mobius_3.0_Helios</td>
</tr>
<tr>
<td>L2J_Mobius_4.0_GrandCrusade</td>
<td>L2J_Mobius_5.0_Salvation</td>
<td>L2J_Mobius_5.5_EtinasFate</td>
</tr>
<tr>
<td>L2J_Mobius_6.0_Fafurion</td>
<td>L2J_Mobius_7.0_PreludeOfWar</td>
<td>L2J_Mobius_8.0_Homunculus</td>
</tr>
<tr>
<td>L2J_Mobius_C1_HarbingersOfWar</td>
<td>L2J_Mobius_C4_ScionsOfDestiny</td>
<td>L2J_Mobius_C6_Interlude</td>
</tr>
<tr>
<td>L2J_Mobius_CT_2.4_Epilogue</td>
<td>L2J_Mobius_CT_2.6_HighFive</td>
<td>L2J_Mobius_Classic_2.0_Saviors</td>
</tr>
<tr>
<td>L2J_Mobius_Classic_2.1_Zaken</td>
<td>L2J_Mobius_Classic_2.2_Antharas</td>
<td>L2J_Mobius_Classic_2.3_SevenSigns</td>
</tr>
<tr>
<td>L2J_Mobius_Classic_2.4_SecretOfEmpire</td>
<td>L2J_Mobius_Classic_3.0_TheKamael</td>
<td>L2J_Mobius_Classic_Interlude</td>
</tr>
<tr>
<td>L2J_Mobius_Essence_4.0_DwellingOfSpirits</td>
</tr>
</table>

----

-v {local/path}:/home/

Путь к папке на локальной машине, не в контейнере!!!!!

----

**ВАЖНО!!!**

В настройках Docker для Windows у вас должна быть расшарена папка для контейнера.

<img src="https://i.imgur.com/WUdGfHB.png" alt="drawing" />
