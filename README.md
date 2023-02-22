# data-bootcamp
0220 day6
cent os
# ip 주소확인
ip addr

cd == change directory
이동
ls ==파일목록

q! 강제 종료
: 명령어 모드로 이동
wq 쓰고 나가기

vi ifcfg-enp0s8  yes로 변경 (나는 지금 3밖에 없음)



putty (드래그 == 복사, 마우스 오른쪽 == 붙여넣기, 컨트롤씨 == 인터럽트)
enp0s8 ip주소 복사(192:~) 후 host name에 붙여넣기 (혹은 타이핑) 후 오픈
> 허용 > root/패스워드 > ping 8.8.8.8 (구글의 DNS 서버주소)

아이피 드래그 후 메모장에 복붙

vi 신형으로 설치
yum install vim > y > vim a.txt 

visual mode
i > insert 모드(작성모드), esc > 저장(visual mode), : > 명령어모드, 
wq > writequit, q! > quit 강제, w > write
history > 과거 명령어보기, !숫자 > history 안 명령어 실행
pwd > 현재 위치

cd /etc/sysconfig/network-scripts/ 
vim ifcfg-enp0s8
i 누르고 > IPADDR = 192.168.56.101 > esc > :wq > reboot

restart section > root/password > ip addr

# DB 설치
yum install mariadb-server -y

# 시작 demon 등록
# 서버 구동될때 자동으로 실행
# --now는 등록동시에 구동
systemctl enable --now mariadb

systemctl status mariadb > active 구동 확인

# mysql setting 
mysql_secure_installation

#mysql 구동
mysql -uroot -p

#신규 계정 설정+외부 접속 가능하도록
CREATE USER 'encore'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON *.* TO 'encore'@'%';

#리눅스 모드
cd /etc/my.cnf.d/

# DB접속 및 sql 쉽게 할 수 있게 해주는 프로그램
HeidiSQL - 무료, 가볍
cent os ip주소 입력+id/pw 입력

#방화벽 확인
firewall-cmd --state
#방화벽에 3306 포트 허용
firewall-cmd --zone=public --add-port=3306/tcp --permanent
#갱신+방화벽 포트(실제 열려있는) 확인
firewall-cmd --reload
firewall-cmd --list-ports

MYSQL 구조
play 테이블 저장소(파이썬에서 만든거)
CREATE TABLE 테이블 이름 (컬럼, 컬럼형식(수량))
블럭 지정후 컨트롤 에프9 == 이 쿼리만 실행
commit 하면 데이터 들어감
PRIMARY KEY 테이블 안에서 유니크한 값을 잡아줌



-0222 day8
# 리눅스
# 데몬 프로세스
#cent os  
#계정 생성
adduser encore
passwd encore  
  
#su > 계정 이동
su encore
#whoami > 현재 로그인 된 계정
whoami  

~ > home directory   
pwd > 현재 위치   

#새로 만든 계정은 시스템에 설치, 수정, 기록 불가  
#계정 logout = exit   

#회사에 갈 경우 git hub 사용 힘듬 > 자체적으로 가상머신에 git 생성해 업무 이용
#git 계정생성
adduser git
passwd git
#git 설치
yum install git -y  
su git  
whoami > pwd
#보안키 설정  
ssh-keygen -t rsa  

ls -al > 숨겨진 파일의 정보들을 보여줘
cat > 보는 거
cd .ssh > ssh 키로 가
cat id_rsa.pub > authorized_keys 
chmod 600 authorized_keys  

git bash 실행 > ssh-keygen -t rsa > cd ~/.ssh > cat id_rsa.pub
vim authorized_keys (키 복붙)
cd ~ > mkdir repos(레포 생성) > cd ./repos(현재 /home/git/repos에 있음)  

git init --bare./ (현재 폴더를 저장소에서 초기화)  
#git 상태 보기 > git status  

stock = pd.read_sql_query("select * from stock_day", con)

왼쪽은 9일 오른쪽은 22일 
이 두개를 합쳐 merge
왼쪽, 오른쪽 symbol을 기준으로 inner 조인 해줘
left = stock[stock.stock_date == pd.to_datetime('2023-02-09')]
right = stock[stock.stock_date == pd.to_datetime('2023-02-22')]
rt = pd.merge(left[['symbol', 'close']], right[['symbol', 'close']], right_on='symbol',
         left_on='symbol', how='inner')










0221
-mysql 한글설정
cd /etc/my.cnf.d 위치로 먼저 가
vim mysql-clients.cnf

----
i번 누르고 insert 모드 

[mysql]
default-character-set=utf8

[mysql_upgrade]

[mysqladmin]

[mysqlbinlog]

[mysqlcheck]

[mysqldump]
default-character-set=utf8

esc 누르고 (visual mode) -> : (명령어) -> wq
----

vim server.cnf

[server]
character-set-server = utf8
collation-server = utf8_general_ci
init_connect = set names utf8


vim client.cnf 
[client]
default-character-set=utf8

# 재가동
systemctl restart mariadb 
systemctl status mariadb 

-데이터베이스 만들기
CREATE DATABASE test; 

USE test;

- sql 테이블 만들기
CREATE TABLE KRX(
    ISU_CD VARCHAR(200),
    ISU_SRT_CD VARCHAR(200),
    ISU_NM VARCHAR(200),
    ISU_ABBRV VARCHAR(200),
    ISU_ENG_NM VARCHAR(200),
    LIST_DD VARCHAR(200),
    MKT_TP_NM VARCHAR(200),
    SECUGRP_NM VARCHAR(200),
    SECT_TP_NM VARCHAR(200),
    KIND_STKCERT_TP_NM VARCHAR(200),
    PARVAL VARCHAR(200),
    LIST_SHRS VARCHAR(200),
    PRIMARY KEY(ISU_SRT_CD)
    );

- 데이터 넣기
import requests 
import pymysql
try:
    con = pymysql.connect(host='192.168.56.101', 
                          user='encore', password='123', 
                          charset='utf8', db='test')
    cur = con.cursor()
except Exception as e:
    print ("error ->", e)

- url에서 데이터를 크롤링
krx_url = "http://data.krx.co.kr/comm/bldAttendant/getJsonData.cmd"
payload = {"bld"  : "dbms/MDC/STAT/standard/MDCSTAT01901",
            "locale"  : "ko_KR",
            "mktId"  : "ALL",
            "share"  : "1",
            "csvxls_isNo"  : "false",}
r = requests.post(krx_url, data=payload)

rt = r.json()

-크롤링한 데이터를 입력해줘
sql = "INSERT INTO KRX VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

for data in rt['OutBlock_1']:
    try:
        cur.execute(sql, list(data.values()))
    except:
        pass


con.commit()

- KRX에서 코스피 코스닥 쿼리를 가져와줘 
SELECT *  검색해 전부
FROM KRX
WHERE MKT_TP_NM IN ('KOSPI', 'KOSDAQ')

-판다스에서 쿼리 가져오기
import pandas as pd

krx = pd.read_sql_query("""SELECT * 
                        FROM KRX
                        WHERE MKT_TP_NM IN ('KOSPI', 'KOSDAQ')""", con)

- 'ISU_CD' 쿼리의 1번 인덱스를 가져와줘
krx.loc[1, 'ISU_CD']
- 'ISU_CD', 'ISU_NM', 'ISU_SRT_CD'의 1번부터 마지막까지 인덱스를 가져와줘
krx.loc[1:, ['ISU_CD', 'ISU_NM', 'ISU_SRT_CD']]
- 데이터 형식?(엑셀형식?)으로 보여줘
krx.iloc[0:, [1,2,3]]

