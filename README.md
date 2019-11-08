# Urban-built-up-areas

## About all the source code and data
All the source codesource code, raw data and processed data can be downloaded directly from:

[Google Drive](https://drive.google.com/file/d/1MJaE30sJAOPdi_ZAoHeoxjc4jE-bVCZL/view?usp=sharing) or [Baidu Netdisk](https://pan.baidu.com/s/1ZEOZgB4gjuJjQEq6ymSQmg) (Extraction code: `x3r7`)

### Introduction to point of Interest (POI) data used in this study

- Data Description: POI Data of Gaode Map in Xiamen City, Fujian Province, China.

- Time Range: 2019-04-25 to 2019-05-06.

- Data Volume: 342487.

- Data Format: csv.

- Author: Research group of Lina Tang, Institute of Urban Environment, Chinese Academy of Sciences.

- Data field description:

| Column name    | Data type | POI information        |
|----------------|-----------|------------------------|
| adcode         | string    | area code              |
| address        | string    | address                |
| adname         | string    | area name              |
| biz\_type      | string    | industry type          |
| business\_area | string    | business district      |
| citycode       | string    | city coding            |
| cityname       | string    | city name              |
| cost           | string    | per capita consumption |
| id             | string    | unique id              |
| lat            | string    | center latitude        |
| lng            | string    | center longitude       |
| name           | string    | name                   |
| pcode          | string    | province code          |
| PID            | int       | index                  |
| pname          | string    | province name          |
| rating         | string    | rating                 |
| tel            | string    | phone number           |
| type1          | string    | primary category       |
| type2          | string    | secondary category     |
| type3          | string    | tertiary category      |
| typecode       | string    | category code          |
| wgs84\_lat     | string    | WGS84 latitude         |
| wgs84\_lng     | string    | WGS84 longitude        |

- Sample Data:

| adcode | address                                       | adname          | biz\_type | business\_area | citycode | cityname | cost | id         | lat        | lng         | name                                                     | pcode  | pname  | rating | tel                       | type1        | type2                             | type3                      | typecode | PID  |
|--------|-----------------------------------------------|-----------------|-----------|----------------|----------|----------|------|------------|------------|-------------|----------------------------------------------------------|--------|--------|--------|---------------------------|--------------|-----------------------------------|----------------------------|----------|------|
| 350203 | "6\-5, No\. 36, Hongli, Phase 3, Qiaofu City" | Siming District | \[\]      | Lotus front    | 592      | Xiamen   | \[\] | B0FFF4K20A | 24\.477501 | 118\.162028 | "Speedmet Auto Service Co\., Ltd\."                      | 350000 | Fujian | 2\.5   | 0592\-5975161;18750270778 | Auto Service | Automobile Maintenance/Decoration | Automobile Maintenance     | 10400    | 3155 |
| 350206 | "No\. 866, Yuanshan South Road"               | Huli District   | \[\]      | Jiangtou       | 592      | Xiamen   | \[\] | B025003LFK | 24\.50695  | 118\.132966 | Red Italian Auto Parts                                   | 350000 | Fujian | 3\.2   | 0592\-5564225             | Auto Service | Automobile Parts Sales            | Automobile Parts Sales     | 10800    | 3775 |
| 350206 | "No\. 216, Jinshan Xili"                      | Huli District   | \[\]      | Wuhu           | 592      | Xiamen   | \[\] | B0FFHLY3SZ | 24\.50392  | 118\.159567 | Departure car rental                                     | 350000 | Fujian | \[\]   | \[\]                      | Auto Service | Automobile Rental                 | Automobile Rental          | 10900    | 3778 |
| 350203 | 148 Yi'ai Road                                | Siming District | \[\]      | Lotus          | 592      | Xiamen   | \[\] | B0FFHHTQG0 | 24\.486844 | 118\.139406 | Hankook Tire \(Tuohu Car Shop\)                          | 350000 | Fujian | \[\]   | 4001118868                | Auto Service | Automobile Parts Sales            | Automobile Parts Sales     | 10800    | 3780 |
| 350206 | Cai Hangshe 6                                 | Huli District   | \[\]      | Wuhu           | 592      | Xiamen   | \[\] | B0FFJN6NDR | 24\.507545 | 118\.155809 | Sunwalker Rescue Online                                  | 350000 | Fujian | \[\]   | 0592\-7151561;4000040195  | Auto Service | Automobile Service Related        | Automobile Service Related | 10000    | 3783 |
| 350203 | 99 Longshan Middle Road                       | Siming District | \[\]      | Lotus          | 592      | Xiamen   | \[\] | B0FFHHTQEL | 24\.487137 | 118\.139397 | Murray Power Original Used Car \(Xiamen Longshan Store\) | 350000 | Fujian | \[\]   | 0592\-5132899             | Auto Service | Used Automobile Dealer            | Used Automobile Dealer     | 11000    | 3784 |
| 350203 | Lung Cheung Road 5                            | Siming District | \[\]      | Lotus          | 592      | Xiamen   | \[\] | B02500S6L7 | 24\.489043 | 118\.137326 | Xingchengwei Auto Service                                | 350000 | Fujian | \[\]   | 0592\-6135110             | Auto Service | Automobile Service Related        | Automobile Service Related | 10000    | 3786 |
